# Checkr Ruby bindings
# API spec at https://checkr.com/docs/api
require 'cgi'
require 'set'
require 'openssl'
require 'rest_client'
require 'json'
require 'base64'

# Version
require 'checkr/version'

# Resources
require 'checkr/api_class'
require 'checkr/api_resource'
require 'checkr/api_singleton'
require 'checkr/api_list'
require 'checkr/util'

# Requires for classes
require 'checkr/candidate'
require 'checkr/county_criminal_search'
require 'checkr/document'
require 'checkr/document_list'
require 'checkr/geo'
require 'checkr/motor_vehicle_report'
require 'checkr/national_criminal_search'
require 'checkr/report'
require 'checkr/report_list'
require 'checkr/sex_offender_search'
require 'checkr/ssn_trace'
require 'checkr/subscription'
require 'checkr/terrorist_watchlist_search'

# Errors
require 'checkr/errors/checkr_error'
require 'checkr/errors/api_error'
require 'checkr/errors/api_connection_error'
require 'checkr/errors/invalid_request_error'
require 'checkr/errors/authentication_error'

module Checkr
  @api_base = "https://api.checkr.com"
  @api_key = nil

  class << self
    attr_accessor :api_key, :api_base, :api_test
  end

  def self.api_url(path='')
    "#{@api_base}#{path}"
  end

  def self.request(method, path, params={}, headers={})
    verify_api_key(api_key)

    url = api_url(path)

    request_opts = { :verify_ssl => false }

    if [:get, :head, :delete].include?(method.to_s.downcase.to_sym)
      unless params.empty?
        url += URI.parse(url).query ? '&' : '?' + Util.query_string(params)
      end
      params = nil
    end

    headers = default_headers.update(basic_auth_headers(api_key)).update(headers)
    request_opts.update(:headers => headers,
                        :method => method,
                        :open_timeout => 30,
                        :payload => params,
                        :url => url,
                        :timeout => 60)

    begin
      response = execute_request(request_opts)
    rescue Exception => e
      handle_request_error(e, url)
    end

    parse(response)
  end

  # Mostly here for stubbing out during tests.
  def self.execute_request(opts)
    RestClient::Request.execute(opts)
  end

  def self.parse(response)
    begin
      json = JSON.parse(response.body)
    rescue JSON::ParserError
      raise APIError.generic(response.code, response.body)
    end

    json = Util.symbolize_keys(json)
    json
  end

  def self.default_headers
    headers = {
      :user_agent => "Checkr/::API_VERSION:: RubyBindings/#{Checkr::VERSION}",
      :content_type => 'application/x-www-form-urlencoded'
    }

    begin
      headers.update(:x_checkr_client_user_agent => JSON.generate(user_agent))
    rescue => e
      headers.update(:x_checkr_client_raw_user_agent => user_agent.inspect,
                     :error => "#{e} (#{e.class})")
    end
    headers
  end

  def self.basic_auth_headers(api_key=@api_key)
    api_key ||= @api_key
    unless api_key
      raise ArgumentError.new('No API key provided. Set your API key using "Checkr.api_key = <API-KEY>".')
    end

    base_64_key = Base64.encode64("#{api_key}:")
    {
      "Authorization" => "Basic #{base_64_key}",
    }
  end

  def self.user_agent
    @uname ||= get_uname
    lang_version = "#{RUBY_VERSION} p#{RUBY_PATCHLEVEL} (#{RUBY_RELEASE_DATE})"

    {
      :bindings_version => Checkr::VERSION,
      :lang => 'ruby',
      :lang_version => lang_version,
      :platform => RUBY_PLATFORM,
      :publisher => 'checkr',
      :uname => @uname
    }
  end

  def self.get_uname
    `uname -a 2>/dev/null`.strip if RUBY_PLATFORM =~ /linux|darwin/i
  rescue Errno::ENOMEM => ex # couldn't create subprocess
    "uname lookup failed"
  end

  def self.verify_api_key(api_key)
    unless api_key
      raise AuthenticationError.new('No API key provided. ' +
        'Set your API key using "Checkr.api_key = <API-KEY>". ' +
        'You can generate API keys from the Checkr web interface. ' +
        'See https://checkr.com/docs#authentication for details, ' +
        'or email hello@checkr.com if you have any questions.')
    end

    if api_key =~ /\s/
      raise AuthenticationError.new('Your API key is invalid, as it contains ' +
        'whitespace. (HINT: You can double-check your API key from the ' +
        'Checkr web interface. See https://checkr.com/docs#authentication for details, or ' +
        'email hello@checkr.com if you have any questions.)')
    end
  end

  def self.handle_request_error(error, url)
    # First we see if this is an error with a response, and if it is
    # we check to see if there is an http code and body to work with.
    if error.is_a?(RestClient::ExceptionWithResponse)
      if error.http_code && error.http_body
        handle_api_error(error.http_code, error.http_body)
      end
    end

    # If we got here then the error hasn't been handled yet.
    # Handle it as a connection error.
    handle_connection_error(error, url)

    # Finally if we get here we don't know what type of error it is, so just raise it.
    raise error
  end

  def self.handle_connection_error(error, url)
    message = "An error occurred while connecting to Checkr at #{url}."

    case error
    when RestClient::RequestTimeout
      message +=  connection_message

    when RestClient::ServerBrokeConnection
      message = "The connection to the server at (#{url}) broke before the " \
        "request completed. #{connection_message}"

    when RestClient::SSLCertificateNotVerified
      message = "Could not verify Checkr's SSL certificate. " \
        "Please make sure that your network is not intercepting certificates. " \
        "If this problem persists, let us know at hello@checkr.com."

    when SocketError
      message = "Unexpected error when trying to connect to Checkr. " \
        "You may be seeing this message because your DNS is not working. " \
        "To check, try running 'host api.checkr.com' from the command line."

    else
      message = "Unexpected error communicating with Checkr. " \
        "If this problem persists, let us know at hello@checkr.com. #{connection_message}"
    end

    raise APIConnectionError.new(message + "\n\n(Network error: #{error.message}")
  end

  def self.connection_message
    "Please check your internet connection and try again. " \
    "If this problem persists, you should check Checkr's service status at " \
    "https://twitter.com/checkr, or let us know at hello@checkr.com."
  end

  def self.handle_api_error(rcode, rbody)
    begin
      error_obj = JSON.parse(rbody)
    rescue JSON::ParserError
      raise APIError.generic(rcode, rbody)
    end
    error_obj = Util.symbolize_keys(error_obj)
    raise APIError.generic(rcode, rbody) unless error = error_obj[:error]

    case rcode
    when 400, 404
      raise InvalidRequestError.new(error, "", rcode, rbody, error_obj)
    when 401
      raise AuthenticationError.new(error, rcode, rbody, error_obj)
    else
      raise APIError.new(error, rcode, rbody, error_obj)
    end
  end

end

module Checkr
	class Client
    DEFAULT_API_BASE = 'https://api.checkr.com'.freeze

    attr_accessor :api_key, :api_version, :api_base

    def initialize(api_key: '', api_base: DEFAULT_API_BASE)
      @api_key = api_key
      @api_base = api_base
    end

    def self.singleton(**args)
      @singleton ||= new(args)
    end

    def self.api_key=(api_key)
      singleton.api_key = api_key
    end

    def self.api_base=(api_base)
      singleton.host = host
    end
	end
end
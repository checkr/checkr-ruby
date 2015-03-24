# -*- coding: utf-8 -*-
require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class StatusCodesTest < Test::Unit::TestCase

    context 'AuthenticationError' do
      should 'be raised with no API credentials' do
        Checkr.api_key = nil
        assert_raises(AuthenticationError) do
          MockResource.retrieve('fake_id')
        end
      end

      should 'be raised with invalid credentials' do
        Checkr.api_key = 'invalid api key' # spaces aren't valid
        assert_raises(AuthenticationError) do
          MockResource.new('fake_id').refresh
        end
      end

      context 'that has been raised' do
        setup do
          Checkr.api_key = 'invalid'
          response = test_response(test_invalid_api_key_error, 401)
          begin
            @mock.expects(:get).once.raises(RestClient::ExceptionWithResponse.new(response, 401))
            MockResource.retrieve('failing')
          rescue AuthenticationError => e
            @error = e
          end
        end

        should 'have an http status of 401' do
          assert_equal(401, @error.http_status)
        end

        should 'have an http body' do
          assert(!!@error.http_body)
        end

        should 'have a JSON body with an error message' do
          assert(!!@error.json_body[:error][:message])
          assert_equal(test_invalid_api_key_error[:error][:message], @error.json_body[:error][:message])
        end
      end
    end

  end
end

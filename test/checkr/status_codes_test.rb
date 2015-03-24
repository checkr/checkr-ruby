# -*- coding: utf-8 -*-
require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class StatusCodesTest < Test::Unit::TestCase

    context 'InvalidRequestError' do
      should 'be raised when HTTP status code is 400' do
        response = test_response(test_missing_id_error, 400)
        @mock.expects(:get).once.raises(RestClient::ExceptionWithResponse.new(response, 404))
        begin
          MockResource.retrieve('bad_id')
        rescue InvalidRequestError => e
          assert_equal(400, e.http_status)
          assert(!!e.http_body)
          assert(e.json_body.is_a?(Hash))
        end
      end

      should 'be raised when HTTP status code is 404' do
        response = test_response(test_missing_id_error, 404)
        @mock.expects(:get).once.raises(RestClient::ExceptionWithResponse.new(response, 404))
        assert_raises
        begin
          MockResource.retrieve('foo')
        rescue InvalidRequestError => e
          rescued = true
          assert_equal(404, e.http_status)
          assert_equal(true, !!e.http_body)
          assert_equal(true, e.json_body.is_a?(Hash))
        end
        assert(rescued)
      end
    end

    context 'APIError' do
      should 'be raised when HTTP status code is 5XX' do
        response = test_response(test_api_error, 500)
        @mock.expects(:get).once.raises(RestClient::ExceptionWithResponse.new(response, 500))

        begin
          MockResource.new('fake_id').refresh
        rescue APIError => e
          rescued = true
          assert(e.is_a?(APIError))
        end
        assert(rescued)
      end
    end

    context 'AuthenticationError' do
      should 'be raised when HTTP status code is 401 (invalid credentials)' do
        Checkr.api_key = 'invalid'
        response = test_response(test_invalid_api_key_error, 401)
        assert_raises(AuthenticationError) do
          @mock.expects(:get).once.raises(RestClient::ExceptionWithResponse.new(response, 401))
          MockResource.retrieve('failing')
        end
      end
    end

  end
end

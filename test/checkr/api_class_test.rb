# -*- coding: utf-8 -*-
require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class ApiClassTest < Test::Unit::TestCase

    context 'Non-network actions' do
      setup do
        @mock.expects(:get).never
        @mock.expects(:post).never
        @mock.expects(:put).never
        @mock.expects(:delete).never
      end

      should 'not fetch over the network when creating a new APIClass' do
        MockResource.new('fake_id')
      end

      should 'not fetch over the network when creating a new APIClass from a hash' do
        MockResource.construct(test_mock_resource)
      end

      should 'not fetch over the network when setting an attribute' do
        c = MockResource.new('fake_id')
        c.name = 'Another Name'
      end

      should 'not fetch over the network when accessing an attribute' do
        c = MockResource.new('fake_id')
        c.id
      end
    end

    # These GET, POST, etc should really be in a dif test, but this is easier.
    context 'Making a GET request' do
      should 'urlencode values in params and have no payload' do
        response = test_response(test_mock_resource_list)

        # The test is to basically make sure this expectation passes.
        @mock.expects(:get).with do |url, headers, params|
          (url == "#{Checkr.api_base}#{MockResource.path}?page=1&filter=test%20filter" ||
            url == "#{Checkr.api_base}#{MockResource.path}?filter=test%20filter&page=1") &&
          params == nil
        end.returns(response)

        list = MockResource.all({
          :page => 1,
          :filter => 'test filter',
        })
      end

      should 'allow passing an api_key as a param when the global api_key is set' do
        response = test_response(test_mock_resource_list)
        api_key = '123456'

        @mock.expects(:get).with do |url, headers, params|
          (url == "#{Checkr.api_base}#{MockResource.path}?page=1&filter=test%20filter" ||
            url == "#{Checkr.api_base}#{MockResource.path}?filter=test%20filter&page=1") &&
            params == nil &&
            Checkr.api_key == 'foo'
            headers["Authorization"] == "Basic #{Base64.encode64("#{api_key}:")}"
        end.returns(response)

        list = MockResource.all(
          :page => 1,
          :filter => 'test filter',
          :api_key => api_key
        )
      end

      should 'allow passing an api_key as a param when the global api_key is NOT set' do
        response = test_response(test_mock_resource_list)
        api_key = '123456'
        Checkr.api_key = nil

        
        @mock.expects(:get).with do |url, headers, params|
          (url == "#{Checkr.api_base}#{MockResource.path}?page=1&filter=test%20filter" ||
            url == "#{Checkr.api_base}#{MockResource.path}?filter=test%20filter&page=1") &&
            params == nil &&
            headers["Authorization"] == "Basic #{Base64.encode64("#{api_key}:")}"
        end.returns(response)

        assert_equal(Checkr.api_key, nil)

        list = MockResource.all(
          :page => 1,
          :filter => 'test filter',
          :api_key => api_key
        )
      end
    end

    context 'Making a DELETE request' do
      should 'urlencode values in params and have no payload' do
        @mock.expects(:get).once.returns(test_response(test_mock_resource))
        mock_resource = MockResource.retrieve("fake_id")

        @mock.expects(:delete).once.with do |url, headers, payload|
          url == "#{Checkr.api_base}#{mock_resource.path}?reason=delinquent%20payments" && payload.nil?
        end.returns(test_response({}))
        mock_resource.delete(:reason => "delinquent payments")
      end

      should 'allow passing an api_key as a param' do
        api_key = '123456'

        @mock.expects(:get).once.returns(test_response(test_mock_resource))
        mock_resource = MockResource.retrieve("fake_id")

        @mock.expects(:delete).once.with do |url, headers, payload|
          url == "#{Checkr.api_base}#{mock_resource.path}?reason=delinquent%20payments" && payload.nil? &&
          headers["Authorization"] == "Basic #{Base64.encode64("#{api_key}:")}"
        end.returns(test_response({}))
        mock_resource.delete(:reason => "delinquent payments", :api_key => api_key)
      end
    end

    context 'Making a PUT request' do
      should 'have a payload with no query string' do
        @mock.expects(:get).once.returns(test_response(test_mock_resource))
        mock_resource = MockResource.retrieve("fake_id")
        mock_resource.name = "new name"

        @mock.expects(:put).once.with do |url, header, payload|
          payload == { :name => "new name" }
        end.returns(test_response(test_mock_resource))
        mock_resource.save
      end

      should 'allow passing an api_key as a param' do
        api_key = '123456'

        @mock.expects(:get).once.returns(test_response(test_mock_resource))
        mock_resource = MockResource.retrieve("fake_id")
        mock_resource.name = "new name"

        @mock.expects(:put).once.with do |url, headers, payload|
          payload == { :name => "new name"} && 
          headers["Authorization"] == "Basic #{Base64.encode64("#{api_key}:")}"
        end.returns(test_response(test_mock_resource))
        mock_resource.save(:api_key => api_key)
      end
    end

    context 'Making a POST request' do
      should 'have a payload with no query string' do
        params = { :name => "some name" }
        @mock.expects(:post).once.with("#{Checkr.api_base}#{MockResource.path}", anything, params).returns(test_response(test_mock_resource))

        MockResource.create(params)
      end

      should 'allow passing an api_key as a param' do
        api_key = '123456'

        @mock.expects(:post).once.with do |url, headers, payload|
          url == "#{Checkr.api_base}#{MockResource.path}" && payload == { :name => "some name" } &&
          headers["Authorization"] == "Basic #{Base64.encode64("#{api_key}:")}"
        end.returns(test_response(test_mock_resource))

        MockResource.create(:name => "some name", :api_key => api_key)
      end
    end

    context 'APIClass :default_params' do
      context 'api_instance_method' do
        setup do
          @response = test_response(test_mock_resource_list)
          @mr = MockResource.new(test_mock_resource)
        end

        should 'call any provided lambdas and set the result as params' do
          @mock.expects(:put).once.with(anything, anything, { :name => "new name" }).returns(@response)

          @mr.name = "new name"
          @mr.with_lambda
        end

        should 'call any method defined by a symbol and set the results as params' do
          @mock.expects(:put).once.with(anything, anything, { :name => "new name" }).returns(@response)

          @mr.name = "new name"
          @mr.with_symbol
        end

        context 'order priority' do
          # Intended order of priority:
          # 1. Params. eg in mock_resource.save(params, opts), params should take
          #    priority with duplicate keys.
          # 2. Arguments. These should take priority over default values from :params
          #    method.
          # 3. Results from method defined by :default_params. This can be a symbol that is
          #    the name of a method to call, or a lambda (though a hash is preferred).
          should 'prioritize params argument over args and default_params method' do
            params = {
              :name => "not arg name",
              :tarray => ["not method tarray"],
              :thash => { :val => "custom hash" }
            }
            @mock.expects(:put).once.with(anything, anything, params).returns(@response)

            @mr.tarray = ["method array"]
            @mr.with_symbol_and_args("arg name", params)
          end

          should 'prioritize arguments over :default_params' do
            @mock.expects(:put).once.with(anything, anything, { :name => "arg name" }).returns(@response)

            @mr.name = "changed name"
            @mr.with_symbol_and_args("arg name")
          end

          should 'use :default_params method as even when args and params are present' do
            @mock.expects(:put).once.with(anything, anything, {
              :thash => { :val => "params hash" },
              :name => "arg name",
              :tarray => ["change array"],
            }).returns(@response)

            @mr.tarray = ["change array"]
            @mr.with_symbol_and_args("arg name", { :thash => { :val => "params hash" } })
          end
        end
      end

      context 'api_class_method' do
        setup do
          @response = test_response(test_mock_resource_list)
        end

        should 'call any provided lambdas and set the result as params' do
          @mock.expects(:post).once.with(anything, anything, MockResource.default_values).returns(@response)
          MockResource.with_lambda
        end

        should 'call any method defined by a symbol and set the results as params' do
          @mock.expects(:post).once.with(anything, anything, MockResource.default_values).returns(@response)
          MockResource.with_symbol
        end

        context 'order priority' do
          # Intended order of priority:
          # 1. Params. eg in mock_resource.save(params, opts), params should take
          #    priority with duplicate keys.
          # 2. Arguments. These should take priority over default values from :params
          #    method.
          # 3. Results from method defined by :default_params. This can be a symbol that is
          #    the name of a method to call, or a lambda (though a hash is preferred).
          should 'prioritize params argument over args and default_params method' do
            params = {
              :name => "not arg name",
              :tarray => ["not method tarray"],
              :thash => { :val => "custom hash" }
            }
            @mock.expects(:post).once.with(anything, anything, params).returns(@response)
            MockResource.with_symbol_and_args("name arg", params)
          end

          should 'prioritize arguments over :default_params' do
            params = Util.sorta_deep_clone(MockResource.default_values)
            params[:name] = "name arg"
            @mock.expects(:post).once.with(anything, anything, params).returns(@response)
            MockResource.with_symbol_and_args("name arg", params)
          end

          should 'use :default_params method as even when args and params are present' do
            params = {
              :name => "name arg",
              :tarray => MockResource.default_values[:tarray].dup,
              :thash => { :val => "custom hash" }
            }
            @mock.expects(:post).once.with(anything, anything, params).returns(@response)
            MockResource.with_symbol_and_args("name arg", { :thash => { :val => "custom hash" }})
          end
        end
      end
    end


    context 'APIClass#attribute' do
      should 'create a getter method' do
        assert(MockResource.method_defined?(:name))
      end

      should 'create a setter method' do
        assert(MockResource.method_defined?(:name=))
      end

      should 'have no changed attributes after init' do
        mr = MockResource.new(test_mock_resource)
        assert(mr.changed_attributes.empty?)
      end

      should 'keep track of changed attributes' do
        mr = MockResource.new(test_mock_resource)
        assert(mr.changed_attributes.empty?)
        mr.name = "new name"
        assert_equal({:name => "new name"}, mr.changed_attributes)
      end

      should 'keep track of changed arrays' do
        mr = MockResource.new(test_mock_resource)
        assert(mr.changed_attributes.empty?)
        mr.tarray << "new"
        assert_equal({:tarray => test_mock_resource[:tarray] + ["new"]}, mr.changed_attributes)
      end

      should 'keep track of changed hashes' do
        mr = MockResource.new(test_mock_resource)
        assert(mr.changed_attributes.empty?)
        mr.thash[:some_key] = "new value"
        assert_equal({:thash => { :some_key => "new value" }}, mr.changed_attributes)
      end

      context 'constructors' do
        should 'instantiate on #new' do
          mr = MockResource.new(test_mock_resource)
          assert(mr.nested.is_a?(NestedResource))
          assert(mr.nested_alt.is_a?(NestedResource))
          assert(mr.nested_with.is_a?(NestedWithParent))
          assert_equal(mr.path + "/nested_path", mr.nested_with.path)
        end

        should 'instantiate on #construct' do
          mr = MockResource.construct(test_mock_resource)
          assert(mr.nested.is_a?(NestedResource))
          assert(mr.nested_alt.is_a?(NestedResource))
          assert(mr.nested_with.is_a?(NestedWithParent))
          assert_equal(mr.path + "/nested_path", mr.nested_with.path)
        end

        should 'instantiate on #refresh_from' do
          mr = MockResource.new('fake_id')
          assert(mr.nested.nil?)
          mr.refresh_from(test_mock_resource)
          assert(mr.nested.is_a?(NestedResource))
          assert(mr.nested_alt.is_a?(NestedResource))
          assert(mr.nested_with.is_a?(NestedWithParent))
          assert_equal(mr.path + "/nested_path", mr.nested_with.path)
        end

        should 'with default values' do
          mr = MockResource.new('fake_id')
          assert(mr.nested_with.is_a?(NestedWithParent))
          assert_equal(mr.path + "/nested_path", mr.nested_with.path)
        end
      end
    end

    context 'APIClass :constructor' do
      context 'for api_class_method' do
        setup do
          @mock.expects(:get).once.returns(test_response(test_mock_resource))
        end

        should 'create a new MockResource with :constructor => :self' do
          mr = MockResource.with_con_self
          assert(mr.is_a?(MockResource))
        end

        should 'create a new MockResource with :constructor => MockResource' do
          mr = MockResource.with_con_class
          assert(mr.is_a?(MockResource))
        end

        should 'use the lambda with :constructor => lambda{...}' do
          mr = MockResource.with_con_lambda
          assert_equal("lamdba result", mr)
        end

        should 'create a new MockResource with no constructor defined' do
          mr = MockResource.with_con_default
          assert(mr.is_a?(MockResource))
        end
      end

      context 'for api_instance_method' do
        setup do
          @mock.expects(:get).once.returns(test_response(test_mock_resource))
          @mr = MockResource.new('fake_id')
        end

        should 'update this instance with :constructor => :self' do
          @mr.with_con_self
          assert(@mr.is_a?(MockResource))
          assert_equal(test_mock_resource[:id], @mr.id)
        end

        should 'create a new instance with :constructor => MockResource' do
          res = @mr.with_con_class
          assert(res.is_a?(MockResource))
          assert_not_equal(@mr.id, res.id)
        end

        should 'use the lambda with :constructor => lambda{...}' do
          res = @mr.with_con_lambda
          assert_equal("lamdba result", res)
        end

        should 'update this instance with no constructor defined' do
          @mr.with_con_default
          assert(@mr.is_a?(MockResource))
          assert_equal(test_mock_resource[:id], @mr.id)
        end
      end
    end

    context 'APIClass api_*_method arguments' do
      should 'throw an ArgumentError if too few arguments are provided' do
        assert_raises(ArgumentError) { MockResource.retrieve }
      end

      should 'throw an ArgumentError with the name of missing arguments' do
        begin
          MockResource.retrieve
          assert(false, "ArgumentError was expected.")
        rescue ArgumentError => e
          assert(e.message =~ /id/)
        end
      end

      should 'throw an ArgumentError if too many arguments are provided' do
        assert_raises(ArgumentError) { MockResource.retrieve(1, 2, {}, {}) }
      end

      should 'throw an ArgumentError if the param argument is invalid' do
        assert_raises(ArgumentError) { MockResource.retrieve(1, 2) }
      end

      should 'throw an ArgumentError if the opts argument is invalid' do
        assert_raises(ArgumentError) { MockResource.retrieve(1, {}, "abc") }
      end

      should 'not throw an ArgumentError if the opts or params are nil' do
        @mock.expects(:get).times(2).returns(test_response(test_mock_resource))
        MockResource.retrieve(1, nil, {})
        MockResource.retrieve(1, {}, nil)
      end

      should 'urlencode unused arguments via GET' do
        response = test_response(test_mock_resource)
        @mock.expects(:get).with do |url, headers, params|
          (url == "#{Checkr.api_base}#{MockResource.path}/bval/many?a=aval&c=cval" ||
            url == "#{Checkr.api_base}#{MockResource.path}/bval/many?c=cval&a=aval") &&
          params.nil?
        end.returns(response)

        MockResource.many_args_get("aval", "bval", "cval")
      end

      should 'assign unused arguments to the params payload via POST' do
        response = test_response(test_mock_resource)
        @mock.expects(:post).with("#{Checkr.api_base}#{MockResource.path}/bval/many", anything, { :a => "aval", :c => "cval" }).returns(response)

        MockResource.many_args_post("aval", "bval", "cval")
      end
    end

    context 'APIClass api_instance_method paths' do
      should 'use the provided argument if it is present' do
        response = test_response(test_mock_resource)
        @mock.expects(:get).with("#{Checkr.api_base}/custom_path", anything, anything).returns(response)

        mr = MockResource.new(test_mock_resource)
        mr.custom_path("/custom_path")
      end

      should 'use the instance method for path values' do
        response = test_response(test_mock_resource)
        name = "/mock_resource_name"
        @mock.expects(:get).with("#{Checkr.api_base}#{name}", anything, anything).returns(response)

        mr = MockResource.new(test_mock_resource)
        mr.name = name
        mr.name_path
      end

      should 'use the class method for path values' do
        response = test_response(test_mock_resource)
        @mock.expects(:get).with("#{Checkr.api_base}#{MockResource.crazy}", anything, anything).returns(response)

        mr = MockResource.new(test_mock_resource)
        mr.crazy_path
      end
    end

    context 'APIClass api_class_method paths' do
      should 'use the provided argument if it is present' do
        response = test_response(test_mock_resource)
        @mock.expects(:get).with("#{Checkr.api_base}#{MockResource.path}/fake_id", anything, anything).returns(response)

        mr = MockResource.retrieve('fake_id')
      end

      should 'use the class method for path values' do
        response = test_response(test_mock_resource)
        @mock.expects(:get).with("#{Checkr.api_base}#{MockResource.crazy}", anything, anything).returns(response)

        MockResource.crazy_path
      end
    end

  end
end

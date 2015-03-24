require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class ApiListTest < Test::Unit::TestCase

    should 'have an object attribute' do
      assert(APIList.method_defined?(:object))
      assert(APIList.method_defined?(:object=))
    end

    should 'have an data attribute' do
      assert(APIList.method_defined?(:data))
      assert(APIList.method_defined?(:data=))
    end

    should 'be refreshable' do
      lambda = APIList.constructor(:MockResource)
      list = lambda.call({})
      list.construct(test_mock_resource_list)
      assert(list.length > 0)
      list.each do |mr|
        assert(mr.is_a?(MockResource))
      end
    end

  end
end

require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class ApiSingletonTest < Test::Unit::TestCase

    should 'have an object attribute' do
      assert(APISingleton.method_defined?(:object))
      assert(APISingleton.method_defined?(:object=))
    end

  end
end

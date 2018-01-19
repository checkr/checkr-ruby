require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class PackageTest < Test::Unit::TestCase
    setup do
      @package_url = "#{Checkr.api_base}/v1/packages"
    end

    context 'Package class' do
      should 'be retrieveable' do
        id = 'package_id'
        @mock.expects(:get).once.with("#{@package_url}/#{id}", anything, anything)
          .returns(test_response(test_package))
        package = Package.retrieve(id)
        assert(package.is_a?(Package))
      end

      should 'be createable' do
        @mock.expects(:post).once.with(@package_url, anything, test_package)
          .returns(test_response(test_package))
        package = Package.create(test_package)
        assert(package.is_a?(Package))
        assert_equal(test_package[:id], package.id)
      end
    end

    context 'Package instance' do
      should 'be refreshable' do
        @mock.expects(:get).once.with("#{@package_url}/#{test_package[:id]}", anything, anything)
          .returns(test_response(test_package))
        package = Package.new(test_package[:id])
        package.refresh
        assert_equal(test_package[:name], package.name)
      end
    end

    context 'Retrieved Package instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_package))
        @package = Package.retrieve('package_id')
      end

      should 'have the id attribute' do
        assert_equal(test_package[:id], @package.id)
      end

      should 'have the object attribute' do
        assert_equal(test_package[:object], @package.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_package[:uri], @package.uri)
      end

      should 'have the created_at attribute' do
        assert_equal(test_package[:created_at], @package.created_at)
      end

      should 'have the name attribute' do
        assert_equal(test_package[:name], @package.name)
      end

      should 'have the slug attribute' do
        assert_equal(test_package[:slug], @package.slug)
      end

      should 'have the price attribute' do
        assert_equal(test_package[:price], @package.price)
      end

      should 'have screenings attribute' do
        assert_equal(test_package[:screenings], @package.screenings)
      end
    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(Package))
      assert_equal(Package, APIClass.subclass_fetch('package'))
    end

  end
end

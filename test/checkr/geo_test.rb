require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class GeoTest < Test::Unit::TestCase
    setup do
      @geo_url = "#{Checkr.api_base}/v1/geos"
    end

    context 'Geo class' do
      should 'be retrieveable' do
        id = "geo_id"
        @mock.expects(:get).once.with("#{@geo_url}/#{id}", anything, anything).returns(test_response(test_geo))
        geo = Geo.retrieve(id)
        assert(geo.is_a?(Geo))
      end

      should 'be createable' do
        @mock.expects(:post).once.with(@geo_url, anything, test_geo).returns(test_response(test_geo))
        geo = Geo.create(test_geo)
        assert(geo.is_a?(Geo))
        assert_equal(test_geo[:id], geo.id)
      end
    end

    context 'Geo instance' do
      should 'be refreshable' do
        @mock.expects(:get).once.with("#{@geo_url}/#{test_geo[:id]}", anything, anything).returns(test_response(test_geo))
        geo = Geo.new(test_geo[:id])
        geo.refresh
        assert_equal(test_geo[:name], geo.name)
      end
    end


    context 'Retrieved Geo instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_geo))
        @geo = Geo.retrieve('geo_id')
      end

      should 'have the id attribute' do
        assert_equal(test_geo[:id], @geo.id)
      end

      should 'have the object attribute' do
        assert_equal(test_geo[:object], @geo.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_geo[:uri], @geo.uri)
      end

      should 'have the created_at attribute' do
        assert_equal(test_geo[:created_at], @geo.created_at)
      end

      should 'have the name attribute' do
        assert_equal(test_geo[:name], @geo.name)
      end

      should 'have the state attribute' do
        assert_equal(test_geo[:state], @geo.state)
      end

    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(Geo))
      assert_equal(Geo, APIClass.subclass_fetch("geo"))
    end

  end
end

require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class EvictionSearchTest < Test::Unit::TestCase
    setup do
      @eviction_search_url = "#{Checkr.api_base}/v1/eviction_searches"
    end

    context 'EvictionSearch class' do
      should 'be retrieveable' do
        id = "eviction_search_id"
        @mock.expects(:get).once.with("#{@eviction_search_url}/#{id}", anything, anything).returns(test_response(test_eviction_search))
        eviction_search = EvictionSearch.retrieve(id)
        assert(eviction_search.is_a?(EvictionSearch))
      end
    end

    context 'EvictionSearch instance' do
      should 'be refreshable' do
        @mock.expects(:get).once.with("#{@eviction_search_url}/#{test_eviction_search[:id]}", anything, anything).returns(test_response(test_eviction_search))
        eviction_search = EvictionSearch.new(test_eviction_search[:id])
        eviction_search.refresh
        assert_equal(test_eviction_search[:status], eviction_search.status)
      end
    end


    context 'Retrieved EvictionSearch instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_eviction_search))
        @eviction_search = EvictionSearch.retrieve('eviction_search_id')
      end

      should 'have the id attribute' do
        assert_equal(test_eviction_search[:id], @eviction_search.id)
      end

      should 'have the object attribute' do
        assert_equal(test_eviction_search[:object], @eviction_search.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_eviction_search[:uri], @eviction_search.uri)
      end

      should 'have the status attribute' do
        assert_equal(test_eviction_search[:status], @eviction_search.status)
      end

      should 'have the created_at attribute' do
        assert_equal(test_eviction_search[:created_at], @eviction_search.created_at)
      end

      should 'have the completed_at attribute' do
        assert_equal(test_eviction_search[:completed_at], @eviction_search.completed_at)
      end

      should 'have the turnaround_time attribute' do
        assert_equal(test_eviction_search[:turnaround_time], @eviction_search.turnaround_time)
      end

      should 'have the records attribute' do
        assert_equal(test_eviction_search[:records], @eviction_search.records)
      end

    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(EvictionSearch))
      assert_equal(EvictionSearch, APIClass.subclass_fetch("eviction_search"))
    end

  end
end

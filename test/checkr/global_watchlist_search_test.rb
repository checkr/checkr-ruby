require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class GlobalWatchlistSearchTest < Test::Unit::TestCase
    setup do
      @global_watchlist_search_url = "#{Checkr.api_base}/v1/global_watchlist_searches"
    end

    context 'GlobalWatchlistSearch class' do
      should 'be retrieveable' do
        id = "global_watchlist_search_id"
        @mock.expects(:get).once.with("#{@global_watchlist_search_url}/#{id}", anything, anything).returns(test_response(test_global_watchlist_search))
        global_watchlist_search = GlobalWatchlistSearch.retrieve(id)
        assert(global_watchlist_search.is_a?(GlobalWatchlistSearch))
      end
    end

    context 'GlobalWatchlistSearch instance' do
      should 'be refreshable' do
        @mock.expects(:get).once.with("#{@global_watchlist_search_url}/#{test_global_watchlist_search[:id]}", anything, anything).returns(test_response(test_global_watchlist_search))
        global_watchlist_search = GlobalWatchlistSearch.new(test_global_watchlist_search[:id])
        global_watchlist_search.refresh
        assert_equal(test_global_watchlist_search[:status], global_watchlist_search.status)
      end
    end


    context 'Retrieved GlobalWatchlistSearch instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_global_watchlist_search))
        @global_watchlist_search = GlobalWatchlistSearch.retrieve('global_watchlist_search_id')
      end

      should 'have the id attribute' do
        assert_equal(test_global_watchlist_search[:id], @global_watchlist_search.id)
      end

      should 'have the object attribute' do
        assert_equal(test_global_watchlist_search[:object], @global_watchlist_search.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_global_watchlist_search[:uri], @global_watchlist_search.uri)
      end

      should 'have the status attribute' do
        assert_equal(test_global_watchlist_search[:status], @global_watchlist_search.status)
      end

      should 'have the result attribute' do
        assert_equal(test_global_watchlist_search[:result], @global_watchlist_search.result)
      end

      should 'have the cancellation_reason attribute' do
        assert_equal(test_global_watchlist_search[:cancellation_reason], @global_watchlist_search.cancellation_reason)
      end

      should 'have the cancellation_reason_description attribute' do
        assert_equal(test_global_watchlist_search[:cancellation_reason_description], @global_watchlist_search.cancellation_reason_description)
      end

      should 'have the created_at attribute' do
        assert_equal(test_global_watchlist_search[:created_at], @global_watchlist_search.created_at)
      end

      should 'have the completed_at attribute' do
        assert_equal(test_global_watchlist_search[:completed_at], @global_watchlist_search.completed_at)
      end

      should 'have the turnaround_time attribute' do
        assert_equal(test_global_watchlist_search[:turnaround_time], @global_watchlist_search.turnaround_time)
      end

      should 'have the records attribute' do
        assert_equal(test_global_watchlist_search[:records], @global_watchlist_search.records)
      end

    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(GlobalWatchlistSearch))
      assert_equal(GlobalWatchlistSearch, APIClass.subclass_fetch("global_watchlist_search"))
    end

  end
end

require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class TerroristWatchlistSearchTest < Test::Unit::TestCase
    setup do
      @terrorist_watchlist_search_url = "#{Checkr.api_base}/v1/terrorist_watchlist_searches"
    end

    context 'TerroristWatchlistSearch class' do
      should 'be retrieveable' do
        id = "terrorist_watchlist_search_id"
        @mock.expects(:get).once.with("#{@terrorist_watchlist_search_url}/#{id}", anything, anything).returns(test_response(test_terrorist_watchlist_search))
        terrorist_watchlist_search = TerroristWatchlistSearch.retrieve(id)
        assert(terrorist_watchlist_search.is_a?(TerroristWatchlistSearch))
      end
    end

    context 'TerroristWatchlistSearch instance' do
      should 'be refreshable' do
        @mock.expects(:get).once.with("#{@terrorist_watchlist_search_url}/#{test_terrorist_watchlist_search[:id]}", anything, anything).returns(test_response(test_terrorist_watchlist_search))
        terrorist_watchlist_search = TerroristWatchlistSearch.new(test_terrorist_watchlist_search[:id])
        terrorist_watchlist_search.refresh
        assert_equal(test_terrorist_watchlist_search[:status], terrorist_watchlist_search.status)
      end
    end


    context 'Retrieved TerroristWatchlistSearch instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_terrorist_watchlist_search))
        @terrorist_watchlist_search = TerroristWatchlistSearch.retrieve('terrorist_watchlist_search_id')
      end

      should 'have the id attribute' do
        assert_equal(test_terrorist_watchlist_search[:id], @terrorist_watchlist_search.id)
      end

      should 'have the object attribute' do
        assert_equal(test_terrorist_watchlist_search[:object], @terrorist_watchlist_search.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_terrorist_watchlist_search[:uri], @terrorist_watchlist_search.uri)
      end

      should 'have the status attribute' do
        assert_equal(test_terrorist_watchlist_search[:status], @terrorist_watchlist_search.status)
      end

      should 'have the created_at attribute' do
        assert_equal(test_terrorist_watchlist_search[:created_at], @terrorist_watchlist_search.created_at)
      end

      should 'have the completed_at attribute' do
        assert_equal(test_terrorist_watchlist_search[:completed_at], @terrorist_watchlist_search.completed_at)
      end

      should 'have the turnaround_time attribute' do
        assert_equal(test_terrorist_watchlist_search[:turnaround_time], @terrorist_watchlist_search.turnaround_time)
      end

      should 'have the records attribute' do
        assert_equal(test_terrorist_watchlist_search[:records], @terrorist_watchlist_search.records)
      end

    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(TerroristWatchlistSearch))
      assert_equal(TerroristWatchlistSearch, APIClass.subclass_fetch("terrorist_watchlist_search"))
    end

  end
end

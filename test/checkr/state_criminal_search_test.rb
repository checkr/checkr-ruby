require File.expand_path('../test_helper', __dir__)

module Checkr
  class StateCriminalSearchTest < Test::Unit::TestCase

    setup do
      @state_criminal_search_url = "#{Checkr.api_base}/v1/state_criminal_searches"
    end

    context 'StateCriminalSearch class' do
      should 'be retrieveable' do
        id = 'state_criminal_search_id'
        @mock.expects(:get).once.with("#{@state_criminal_search_url}/#{id}", anything, anything)
          .returns(test_response(test_state_criminal_search))
        state_criminal_search = StateCriminalSearch.retrieve(id)
        assert(state_criminal_search.is_a?(StateCriminalSearch))
      end
    end

    context 'StateCriminalSearch instance' do
      should 'be refreshable' do
        @mock.expects(:get).once
          .with("#{@state_criminal_search_url}/#{test_state_criminal_search[:id]}",
                anything, anything)
          .returns(test_response(test_state_criminal_search))
        state_criminal_search = StateCriminalSearch.new(test_state_criminal_search[:id])
        state_criminal_search.refresh
        assert_equal(test_state_criminal_search[:status], state_criminal_search.status)
      end
    end

    context 'Retrieved StateCriminalSearch instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_state_criminal_search))
        @state_criminal_search = StateCriminalSearch.retrieve('state_criminal_search_id')
      end

      should 'have the id attribute' do
        assert_equal(test_state_criminal_search[:id], @state_criminal_search.id)
      end

      should 'have the object attribute' do
        assert_equal(test_state_criminal_search[:object], @state_criminal_search.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_state_criminal_search[:uri], @state_criminal_search.uri)
      end

      should 'have the status attribute' do
        assert_equal(test_state_criminal_search[:status], @state_criminal_search.status)
      end

      should 'have the created_at attribute' do
        assert_equal(test_state_criminal_search[:created_at], @state_criminal_search.created_at)
      end

      should 'have the completed_at attribute' do
        assert_equal(test_state_criminal_search[:completed_at], @state_criminal_search.completed_at)
      end

      should 'have the turnaround_time attribute' do
        assert_equal(test_state_criminal_search[:turnaround_time],
                     @state_criminal_search.turnaround_time)
      end

      should 'have the state attribute' do
        assert_equal(test_state_criminal_search[:state], @state_criminal_search.state)
      end

      should 'have the records attribute' do
        assert_equal(test_state_criminal_search[:records], @state_criminal_search.records)
      end
    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(StateCriminalSearch))
      assert_equal(StateCriminalSearch, APIClass.subclass_fetch('state_criminal_search'))
    end

  end
end

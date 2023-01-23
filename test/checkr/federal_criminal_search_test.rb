require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class FederalCriminalSearchTest < Test::Unit::TestCase
    setup do
      @federal_criminal_search_url = "#{Checkr.api_base}/v1/federal_criminal_searches"
    end

    context 'FederalCriminalSearch class' do
      should 'be retrieveable' do
        id = "federal_criminal_search_id"
        @mock.expects(:get).once.with("#{@federal_criminal_search_url}/#{id}", anything, anything).returns(test_response(test_federal_criminal_search))
        federal_criminal_search = FederalCriminalSearch.retrieve(id)
        assert(federal_criminal_search.is_a?(FederalCriminalSearch))
      end
    end

    context 'FederalCriminalSearch instance' do
      should 'be refreshable' do
        @mock.expects(:get).once.with("#{@federal_criminal_search_url}/#{test_federal_criminal_search[:id]}", anything, anything).returns(test_response(test_federal_criminal_search))
        federal_criminal_search = FederalCriminalSearch.new(test_federal_criminal_search[:id])
        federal_criminal_search.refresh
        assert_equal(test_federal_criminal_search[:status], federal_criminal_search.status)
      end
    end


    context 'Retrieved FederalCriminalSearch instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_federal_criminal_search))
        @federal_criminal_search = FederalCriminalSearch.retrieve('federal_criminal_search_id')
      end

      should 'have the id attribute' do
        assert_equal(test_federal_criminal_search[:id], @federal_criminal_search.id)
      end

      should 'have the object attribute' do
        assert_equal(test_federal_criminal_search[:object], @federal_criminal_search.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_federal_criminal_search[:uri], @federal_criminal_search.uri)
      end

      should 'have the status attribute' do
        assert_equal(test_federal_criminal_search[:status], @federal_criminal_search.status)
      end

      should 'have the result attribute' do
        assert_equal(test_federal_criminal_search[:result], @federal_criminal_search.result)
      end

      should 'have the cancellation_reason attribute' do
        assert_equal(test_federal_criminal_search[:cancellation_reason], @federal_criminal_search.cancellation_reason)
      end

      should 'have the cancellation_reason_description attribute' do
        assert_equal(test_federal_criminal_search[:cancellation_reason_description], @federal_criminal_search.cancellation_reason_description)
      end

      should 'have the created_at attribute' do
        assert_equal(test_federal_criminal_search[:created_at], @federal_criminal_search.created_at)
      end

      should 'have the completed_at attribute' do
        assert_equal(test_federal_criminal_search[:completed_at], @federal_criminal_search.completed_at)
      end

      should 'have the turnaround_time attribute' do
        assert_equal(test_federal_criminal_search[:turnaround_time], @federal_criminal_search.turnaround_time)
      end

      should 'have the records attribute' do
        assert_equal(test_federal_criminal_search[:records], @federal_criminal_search.records)
      end

    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(FederalCriminalSearch))
      assert_equal(FederalCriminalSearch, APIClass.subclass_fetch("federal_criminal_search"))
    end

  end
end

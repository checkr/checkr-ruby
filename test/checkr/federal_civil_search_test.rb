require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class FederalCivilSearchTest < Test::Unit::TestCase
    setup do
      @federal_civil_search_url = "#{Checkr.api_base}/v1/federal_civil_searches"
    end

    context 'FederalCivilSearch class' do
      should 'be retrieveable' do
        id = "federal_civil_search_id"
        @mock.expects(:get).once.with("#{@federal_civil_search_url}/#{id}", anything, anything).returns(test_response(test_federal_civil_search))
        federal_civil_search = FederalCivilSearch.retrieve(id)
        assert(federal_civil_search.is_a?(FederalCivilSearch))
      end
    end

    context 'FederalCivilSearch instance' do
      should 'be refreshable' do
        @mock.expects(:get).once.with("#{@federal_civil_search_url}/#{test_federal_civil_search[:id]}", anything, anything).returns(test_response(test_federal_civil_search))
        federal_civil_search = FederalCivilSearch.new(test_federal_civil_search[:id])
        federal_civil_search.refresh
        assert_equal(test_federal_civil_search[:status], federal_civil_search.status)
      end
    end


    context 'Retrieved FederalCivilSearch instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_federal_civil_search))
        @federal_civil_search = FederalCivilSearch.retrieve('federal_civil_search_id')
      end

      should 'have the id attribute' do
        assert_equal(test_federal_civil_search[:id], @federal_civil_search.id)
      end

      should 'have the object attribute' do
        assert_equal(test_federal_civil_search[:object], @federal_civil_search.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_federal_civil_search[:uri], @federal_civil_search.uri)
      end

      should 'have the status attribute' do
        assert_equal(test_federal_civil_search[:status], @federal_civil_search.status)
      end

      should 'have the result attribute' do
        assert_equal(test_federal_civil_search[:result], @federal_civil_search.result)
      end

      should 'have the cancellation_reason attribute' do
        assert_equal(test_federal_civil_search[:cancellation_reason], @federal_civil_search.cancellation_reason)
      end

      should 'have the cancellation_reason_description attribute' do
        assert_equal(test_federal_civil_search[:cancellation_reason_description], @federal_civil_search.cancellation_reason_description)
      end

      should 'have the created_at attribute' do
        assert_equal(test_federal_civil_search[:created_at], @federal_civil_search.created_at)
      end

      should 'have the completed_at attribute' do
        assert_equal(test_federal_civil_search[:completed_at], @federal_civil_search.completed_at)
      end

      should 'have the turnaround_time attribute' do
        assert_equal(test_federal_civil_search[:turnaround_time], @federal_civil_search.turnaround_time)
      end

      should 'have the records attribute' do
        assert_equal(test_federal_civil_search[:records], @federal_civil_search.records)
      end

    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(FederalCivilSearch))
      assert_equal(FederalCivilSearch, APIClass.subclass_fetch("federal_civil_search"))
    end

  end
end

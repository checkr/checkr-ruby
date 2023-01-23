require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class SexOffenderSearchTest < Test::Unit::TestCase
    setup do
      @sex_offender_search_url = "#{Checkr.api_base}/v1/sex_offender_searches"
    end

    context 'SexOffenderSearch class' do
      should 'be retrieveable' do
        id = "sex_offender_search_id"
        @mock.expects(:get).once.with("#{@sex_offender_search_url}/#{id}", anything, anything).returns(test_response(test_sex_offender_search))
        sex_offender_search = SexOffenderSearch.retrieve(id)
        assert(sex_offender_search.is_a?(SexOffenderSearch))
      end
    end

    context 'SexOffenderSearch instance' do
      should 'be refreshable' do
        @mock.expects(:get).once.with("#{@sex_offender_search_url}/#{test_sex_offender_search[:id]}", anything, anything).returns(test_response(test_sex_offender_search))
        sex_offender_search = SexOffenderSearch.new(test_sex_offender_search[:id])
        sex_offender_search.refresh
        assert_equal(test_sex_offender_search[:status], sex_offender_search.status)
      end
    end


    context 'Retrieved SexOffenderSearch instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_sex_offender_search))
        @sex_offender_search = SexOffenderSearch.retrieve('sex_offender_search_id')
      end

      should 'have the id attribute' do
        assert_equal(test_sex_offender_search[:id], @sex_offender_search.id)
      end

      should 'have the object attribute' do
        assert_equal(test_sex_offender_search[:object], @sex_offender_search.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_sex_offender_search[:uri], @sex_offender_search.uri)
      end

      should 'have the status attribute' do
        assert_equal(test_sex_offender_search[:status], @sex_offender_search.status)
      end

      should 'have the result attribute' do
        assert_equal(test_sex_offender_search[:result], @sex_offender_search.result)
      end

      should 'have the cancellation_reason attribute' do
        assert_equal(test_sex_offender_search[:cancellation_reason], @sex_offender_search.cancellation_reason)
      end

      should 'have the cancellation_reason_description attribute' do
        assert_equal(test_sex_offender_search[:cancellation_reason_description], @sex_offender_search.cancellation_reason_description)
      end

      should 'have the created_at attribute' do
        assert_equal(test_sex_offender_search[:created_at], @sex_offender_search.created_at)
      end

      should 'have the completed_at attribute' do
        assert_equal(test_sex_offender_search[:completed_at], @sex_offender_search.completed_at)
      end

      should 'have the turnaround_time attribute' do
        assert_equal(test_sex_offender_search[:turnaround_time], @sex_offender_search.turnaround_time)
      end

      should 'have the records attribute' do
        assert_equal(test_sex_offender_search[:records], @sex_offender_search.records)
      end


    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(SexOffenderSearch))
      assert_equal(SexOffenderSearch, APIClass.subclass_fetch("sex_offender_search"))
    end

  end
end

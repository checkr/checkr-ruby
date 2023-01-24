require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class CountyCriminalSearchTest < Test::Unit::TestCase
    setup do
      @county_criminal_search_url = "#{Checkr.api_base}/v1/county_criminal_searches"
    end

    context 'CountyCriminalSearch class' do
      should 'be retrieveable' do
        id = "county_criminal_search_id"
        @mock.expects(:get).once.with("#{@county_criminal_search_url}/#{id}", anything, anything).returns(test_response(test_county_criminal_search))
        county_criminal_search = CountyCriminalSearch.retrieve(id)
        assert(county_criminal_search.is_a?(CountyCriminalSearch))
      end
    end

    context 'CountyCriminalSearch instance' do
      should 'be refreshable' do
        @mock.expects(:get).once.with("#{@county_criminal_search_url}/#{test_county_criminal_search[:id]}", anything, anything).returns(test_response(test_county_criminal_search))
        county_criminal_search = CountyCriminalSearch.new(test_county_criminal_search[:id])
        county_criminal_search.refresh
        assert_equal(test_county_criminal_search[:status], county_criminal_search.status)
      end
    end


    context 'Retrieved CountyCriminalSearch instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_county_criminal_search))
        @county_criminal_search = CountyCriminalSearch.retrieve('county_criminal_search_id')
      end

      should 'have the id attribute' do
        assert_equal(test_county_criminal_search[:id], @county_criminal_search.id)
      end

      should 'have the object attribute' do
        assert_equal(test_county_criminal_search[:object], @county_criminal_search.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_county_criminal_search[:uri], @county_criminal_search.uri)
      end

      should 'have the status attribute' do
        assert_equal(test_county_criminal_search[:status], @county_criminal_search.status)
      end

      should 'have the result attribute' do
        assert_equal(test_county_criminal_search[:result], @county_criminal_search.result)
      end

      should 'have the cancellation_reason attribute' do
        assert_equal(test_county_criminal_search[:cancellation_reason], @county_criminal_search.cancellation_reason)
      end

      should 'have the cancellation_reason_description attribute' do
        assert_equal(test_county_criminal_search[:cancellation_reason_description], @county_criminal_search.cancellation_reason_description)
      end

      should 'have the created_at attribute' do
        assert_equal(test_county_criminal_search[:created_at], @county_criminal_search.created_at)
      end

      should 'have the completed_at attribute' do
        assert_equal(test_county_criminal_search[:completed_at], @county_criminal_search.completed_at)
      end

      should 'have the turnaround_time attribute' do
        assert_equal(test_county_criminal_search[:turnaround_time], @county_criminal_search.turnaround_time)
      end

      should 'have the county attribute' do
        assert_equal(test_county_criminal_search[:county], @county_criminal_search.county)
      end

      should 'have the state attribute' do
        assert_equal(test_county_criminal_search[:state], @county_criminal_search.state)
      end

      should 'have the records attribute' do
        assert_equal(test_county_criminal_search[:records], @county_criminal_search.records)
      end

    end

    context 'have cancellation reasons' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_county_criminal_search.merge(
          {
            status: 'canceled',
            result: nil,
            cancellation_reason: 'complete_now_customer_requested',
            cancellation_reason_description: 'Customer requested Complete Now prior to screening completion',
          })))
        @county_criminal_search = CountyCriminalSearch.retrieve('county_criminal_search_id')
      end

      should 'have the correct attribute' do
        assert_equal(@county_criminal_search.status, 'canceled')
        assert_equal(@county_criminal_search.result, nil)
        assert_equal(@county_criminal_search.cancellation_reason, 'complete_now_customer_requested')
        assert_equal(@county_criminal_search.cancellation_reason_description, 'Customer requested Complete Now prior to screening completion')
      end
    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(CountyCriminalSearch))
      assert_equal(CountyCriminalSearch, APIClass.subclass_fetch("county_criminal_search"))
    end

  end
end

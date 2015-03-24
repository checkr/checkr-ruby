require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class NationalCriminalSearchTest < Test::Unit::TestCase
    setup do
      @national_criminal_search_url = "#{Checkr.api_base}/v1/national_criminal_searches"
    end

    context 'NationalCriminalSearch class' do
      should 'be retrieveable' do
        id = "national_criminal_search_id"
        @mock.expects(:get).once.with("#{@national_criminal_search_url}/#{id}", anything, anything).returns(test_response(test_national_criminal_search))
        national_criminal_search = NationalCriminalSearch.retrieve(id)
        assert(national_criminal_search.is_a?(NationalCriminalSearch))
      end
    end

    context 'NationalCriminalSearch instance' do
      should 'be refreshable' do
        @mock.expects(:get).once.with("#{@national_criminal_search_url}/#{test_national_criminal_search[:id]}", anything, anything).returns(test_response(test_national_criminal_search))
        national_criminal_search = NationalCriminalSearch.new(test_national_criminal_search[:id])
        national_criminal_search.refresh
        assert_equal(test_national_criminal_search[:status], national_criminal_search.status)
      end
    end


    context 'Retrieved NationalCriminalSearch instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_national_criminal_search))
        @national_criminal_search = NationalCriminalSearch.retrieve('national_criminal_search_id')
      end

      should 'have the id attribute' do
        assert_equal(test_national_criminal_search[:id], @national_criminal_search.id)
      end

      should 'have the object attribute' do
        assert_equal(test_national_criminal_search[:object], @national_criminal_search.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_national_criminal_search[:uri], @national_criminal_search.uri)
      end

      should 'have the status attribute' do
        assert_equal(test_national_criminal_search[:status], @national_criminal_search.status)
      end

      should 'have the created_at attribute' do
        assert_equal(test_national_criminal_search[:created_at], @national_criminal_search.created_at)
      end

      should 'have the completed_at attribute' do
        assert_equal(test_national_criminal_search[:completed_at], @national_criminal_search.completed_at)
      end

      should 'have the turnaround_time attribute' do
        assert_equal(test_national_criminal_search[:turnaround_time], @national_criminal_search.turnaround_time)
      end

      should 'have the records attribute' do
        assert_equal(test_national_criminal_search[:records], @national_criminal_search.records)
      end

    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(NationalCriminalSearch))
      assert_equal(NationalCriminalSearch, APIClass.subclass_fetch("national_criminal_search"))
    end

  end
end

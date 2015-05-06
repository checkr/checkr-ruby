require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class ReportTest < Test::Unit::TestCase
    setup do
      @report_url = "#{Checkr.api_base}/v1/reports"
    end

    context 'Report class' do
      should 'be retrieveable' do
        id = "report_id"
        @mock.expects(:get).once.with("#{@report_url}/#{id}", anything, anything).returns(test_response(test_report))
        report = Report.retrieve(id)
        assert(report.is_a?(Report))
      end

      should 'be createable' do
        @mock.expects(:post).once.with(@report_url, anything, test_report).returns(test_response(test_report))
        report = Report.create(test_report)
        assert(report.is_a?(Report))
        assert_equal(test_report[:id], report.id)
      end
    end

    context 'Report instance' do
      should 'be refreshable' do
        @mock.expects(:get).once.with("#{@report_url}/#{test_report[:id]}", anything, anything).returns(test_response(test_report))
        report = Report.new(test_report[:id])
        report.refresh
        assert_equal(test_report[:package], report.package)
      end

      should 'be updateable' do
        report = Report.new(test_report)
        report.package = "driver_plus"

        @mock.expects(:post).once.with do |url, headers, params|
          params == report.changed_attributes && url == "#{@report_url}/#{report.id}"
        end.returns(test_response(test_report))

        # This should update this instance with test_report since it was returned
        report.save
        assert_equal(test_report[:package], report.package)
      end
    end


    context 'Retrieved Report instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_report))
        @report = Report.retrieve('report_id')
      end

      should 'have the id attribute' do
        assert_equal(test_report[:id], @report.id)
      end

      should 'have the object attribute' do
        assert_equal(test_report[:object], @report.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_report[:uri], @report.uri)
      end

      should 'have the status attribute' do
        assert_equal(test_report[:status], @report.status)
      end

      should 'have the created_at attribute' do
        assert_equal(test_report[:created_at], @report.created_at)
      end

      should 'have the completed_at attribute' do
        assert_equal(test_report[:completed_at], @report.completed_at)
      end

      should 'have the turnaround_time attribute' do
        assert_equal(test_report[:turnaround_time], @report.turnaround_time)
      end

      should 'have the package attribute' do
        assert_equal(test_report[:package], @report.package)
      end

      should 'have the candidate_id attribute' do
        assert_equal(test_report[:candidate_id], @report.candidate.id)
        assert(@report.candidate.is_a?(Candidate))
      end

      should 'have the ssn_trace_id attribute' do
        assert_equal(test_report[:ssn_trace_id], @report.ssn_trace.id)
        assert(@report.ssn_trace.is_a?(SSNTrace))
      end

      should 'have the sex_offender_search_id attribute' do
        assert_equal(test_report[:sex_offender_search_id], @report.sex_offender_search.id)
        assert(@report.sex_offender_search.is_a?(SexOffenderSearch))
      end

      should 'have the national_criminal_search_id attribute' do
        assert_equal(test_report[:national_criminal_search_id], @report.national_criminal_search.id)
        assert(@report.national_criminal_search.is_a?(NationalCriminalSearch))
      end

      should 'have the terrorist_watchlist_search_id attribute' do
        assert_equal(test_report[:terrorist_watchlist_search_id], @report.terrorist_watchlist_search.id)
        assert(@report.terrorist_watchlist_search.is_a?(TerroristWatchlistSearch))
      end

      should 'have the county_criminal_search_ids attribute' do
        assert_equal(test_report[:county_criminal_search_ids], @report.county_criminal_searches.json)
        assert(@report.county_criminal_searches.is_a?(APIList))
      end

      should 'have the motor_vehicle_report_id attribute' do
        assert_equal(test_report[:motor_vehicle_report_id], @report.motor_vehicle_report.id)
        assert(@report.motor_vehicle_report.is_a?(MotorVehicleReport))
      end

      should 'have the eviction_search_id attribute' do
        assert_equal(test_report[:eviction_search_id], @report.eviction_search.id)
        assert(@report.eviction_search.is_a?(EvictionSearch))
      end

    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(Report))
      assert_equal(Report, APIClass.subclass_fetch("report"))
    end

  end
end

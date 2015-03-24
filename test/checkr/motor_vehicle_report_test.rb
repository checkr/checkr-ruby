require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class MotorVehicleReportTest < Test::Unit::TestCase
    setup do
      @motor_vehicle_report_url = "#{Checkr.api_base}/v1/motor_vehicle_reports"
    end

    context 'MotorVehicleReport class' do
      should 'be retrieveable' do
        id = "motor_vehicle_report_id"
        @mock.expects(:get).once.with("#{@motor_vehicle_report_url}/#{id}", anything, anything).returns(test_response(test_motor_vehicle_report))
        motor_vehicle_report = MotorVehicleReport.retrieve(id)
        assert(motor_vehicle_report.is_a?(MotorVehicleReport))
      end
    end

    context 'MotorVehicleReport instance' do
      should 'be refreshable' do
        @mock.expects(:get).once.with("#{@motor_vehicle_report_url}/#{test_motor_vehicle_report[:id]}", anything, anything).returns(test_response(test_motor_vehicle_report))
        motor_vehicle_report = MotorVehicleReport.new(test_motor_vehicle_report[:id])
        motor_vehicle_report.refresh
        assert_equal(test_motor_vehicle_report[:status], motor_vehicle_report.status)
      end
    end


    context 'Retrieved MotorVehicleReport instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_motor_vehicle_report))
        @motor_vehicle_report = MotorVehicleReport.retrieve('motor_vehicle_report_id')
      end

      should 'have the id attribute' do
        assert_equal(test_motor_vehicle_report[:id], @motor_vehicle_report.id)
      end

      should 'have the object attribute' do
        assert_equal(test_motor_vehicle_report[:object], @motor_vehicle_report.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_motor_vehicle_report[:uri], @motor_vehicle_report.uri)
      end

      should 'have the status attribute' do
        assert_equal(test_motor_vehicle_report[:status], @motor_vehicle_report.status)
      end

      should 'have the created_at attribute' do
        assert_equal(test_motor_vehicle_report[:created_at], @motor_vehicle_report.created_at)
      end

      should 'have the completed_at attribute' do
        assert_equal(test_motor_vehicle_report[:completed_at], @motor_vehicle_report.completed_at)
      end

      should 'have the turnaround_time attribute' do
        assert_equal(test_motor_vehicle_report[:turnaround_time], @motor_vehicle_report.turnaround_time)
      end

      should 'have the full_name attribute' do
        assert_equal(test_motor_vehicle_report[:full_name], @motor_vehicle_report.full_name)
      end

      should 'have the license_number attribute' do
        assert_equal(test_motor_vehicle_report[:license_number], @motor_vehicle_report.license_number)
      end

      should 'have the license_state attribute' do
        assert_equal(test_motor_vehicle_report[:license_state], @motor_vehicle_report.license_state)
      end

      should 'have the previous_license_number attribute' do
        assert_equal(test_motor_vehicle_report[:previous_license_number], @motor_vehicle_report.previous_license_number)
      end

      should 'have the previous_license_state attribute' do
        assert_equal(test_motor_vehicle_report[:previous_license_state], @motor_vehicle_report.previous_license_state)
      end

      should 'have the license_status attribute' do
        assert_equal(test_motor_vehicle_report[:license_status], @motor_vehicle_report.license_status)
      end

      should 'have the license_type attribute' do
        assert_equal(test_motor_vehicle_report[:license_type], @motor_vehicle_report.license_type)
      end

      should 'have the license_class attribute' do
        assert_equal(test_motor_vehicle_report[:license_class], @motor_vehicle_report.license_class)
      end

      should 'have the expiration_date attribute' do
        assert_equal(test_motor_vehicle_report[:expiration_date], @motor_vehicle_report.expiration_date)
      end

      should 'have the issued_date attribute' do
        assert_equal(test_motor_vehicle_report[:issued_date], @motor_vehicle_report.issued_date)
      end

      should 'have the first_issued_date attribute' do
        assert_equal(test_motor_vehicle_report[:first_issued_date], @motor_vehicle_report.first_issued_date)
      end

      should 'have the inferred_issued_date attribute' do
        assert_equal(test_motor_vehicle_report[:inferred_issued_date], @motor_vehicle_report.inferred_issued_date)
      end

      should 'have the restrictions attribute' do
        assert_equal(test_motor_vehicle_report[:restrictions], @motor_vehicle_report.restrictions)
      end

      should 'have the accidents attribute' do
        assert_equal(test_motor_vehicle_report[:accidents], @motor_vehicle_report.accidents)
      end

      should 'have the violations attribute' do
        assert_equal(test_motor_vehicle_report[:violations], @motor_vehicle_report.violations)
      end

    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(MotorVehicleReport))
      assert_equal(MotorVehicleReport, APIClass.subclass_fetch("motor_vehicle_report"))
    end

  end
end

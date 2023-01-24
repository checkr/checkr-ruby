module Checkr
  class MotorVehicleReport < APIResource

    attribute :status
    attribute :result
    attribute :cancellation_reason
    attribute :cancellation_reason_description
    attribute :completed_at
    attribute :turnaround_time
    attribute :full_name
    attribute :license_number
    attribute :license_state
    attribute :previous_license_number
    attribute :previous_license_state
    attribute :license_status
    attribute :license_type
    attribute :license_class
    attribute :expiration_date
    attribute :issued_date
    attribute :first_issued_date
    attribute :inferred_issued_date
    attribute :restrictions
    attribute :accidents
    attribute :violations

    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]

    def self.path
      "/v1/motor_vehicle_reports"
    end

    APIClass.register_subclass(self, "motor_vehicle_report")
  end
end

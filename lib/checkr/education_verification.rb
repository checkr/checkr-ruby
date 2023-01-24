module Checkr
  class EducationVerification < APIResource

    attribute :status
    attribute :result
    attribute :cancellation_reason
    attribute :cancellation_reason_description
    attribute :includes_canceled
    attribute :completed_at
    attribute :turnaround_time
    attribute :records

    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]

    def self.path
      "/v1/education_verifications"
    end

    APIClass.register_subclass(self, "education_verification")
  end
end

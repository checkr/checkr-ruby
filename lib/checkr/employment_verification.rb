module Checkr
  class EmploymentVerification < APIResource

    attribute :status
    attribute :completed_at
    attribute :turnaround_time
    attribute :records

    api_class_method :retrieve, :get, ':path/:id', arguments: [:id]

    def self.path
      '/v1/employment_verifications'
    end

    APIClass.register_subclass(self, 'employment_verification')

  end
end

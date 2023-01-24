module Checkr
  class SexOffenderSearch < APIResource

    attribute :status
    attribute :result
    attribute :cancellation_reason
    attribute :cancellation_reason_description
    attribute :values
    attribute :completed_at
    attribute :turnaround_time
    attribute :records

    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]

    def self.path
      "/v1/sex_offender_searches"
    end

    APIClass.register_subclass(self, "sex_offender_search")
  end
end

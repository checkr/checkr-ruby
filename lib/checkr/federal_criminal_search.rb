module Checkr
  class FederalCriminalSearch < APIResource

    attribute :status
    attribute :result
    attribute :cancellation_reason
    attribute :cancellation_reason_description
    attribute :completed_at
    attribute :turnaround_time
    attribute :records

    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]

    def self.path
      "/v1/federal_criminal_searches"
    end

    APIClass.register_subclass(self, "federal_criminal_search")
  end
end

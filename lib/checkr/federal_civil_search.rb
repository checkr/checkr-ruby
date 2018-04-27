module Checkr
  class FederalCivilSearch < APIResource

    attribute :status
    attribute :completed_at
    attribute :turnaround_time
    attribute :records

    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]

    def self.path
      "/v1/federal_civil_searches"
    end

    APIClass.register_subclass(self, "federal_civil_search")
  end
end

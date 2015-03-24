module Checkr
  class NationalCriminalSearch < APIResource

    attribute :status
    attribute :completed_at
    attribute :turnaround_time
    attribute :records

    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]

    def self.path
      "/v1/national_criminal_searches"
    end

    APIClass.register_subclass(self, "national_criminal_search")
  end
end

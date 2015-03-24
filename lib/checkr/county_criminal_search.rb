module Checkr
  class CountyCriminalSearch < APIResource

    attribute :status
    attribute :completed_at
    attribute :turnaround_time
    attribute :county
    attribute :state
    attribute :records

    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]

    def self.path
      "/v1/county_criminal_searches"
    end

    APIClass.register_subclass(self, "county_criminal_search")
  end
end

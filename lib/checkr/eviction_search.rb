module Checkr
  class EvictionSearch < APIResource

    attribute :status
    attribute :result
    attribute :cancellation_reason
    attribute :cancellation_reason_description
    attribute :completed_at
    attribute :turnaround_time
    attribute :records

    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]

    def self.path
      "/v1/eviction_searches"
    end

    APIClass.register_subclass(self, "eviction_search")
  end
end

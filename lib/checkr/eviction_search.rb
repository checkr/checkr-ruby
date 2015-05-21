module Checkr
  class EvictionSearch < APIResource

    attribute :status
    attribute :completed_at
    attribute :turnaround_time
    attribute :records

    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]

    def self.path
      "/v1/evictions"
    end

    APIClass.register_subclass(self, "eviction_search")
  end
end

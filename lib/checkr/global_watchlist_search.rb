module Checkr
  class GlobalWatchlistSearch < APIResource

    attribute :status
    attribute :result
    attribute :cancellation_reason
    attribute :cancellation_reason_description
    attribute :completed_at
    attribute :turnaround_time
    attribute :records

    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]

    def self.path
      "/v1/global_watchlist_searches"
    end

    APIClass.register_subclass(self, "global_watchlist_search")
  end
end

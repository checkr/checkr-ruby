module Checkr
  class TerroristWatchlistSearch < APIResource

    attribute :status
    attribute :completed_at
    attribute :turnaround_time
    attribute :records

    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]

    def self.path
      "/v1/terrorist_watchlist_searches"
    end

    APIClass.register_subclass(self, "terrorist_watchlist_search")
  end
end

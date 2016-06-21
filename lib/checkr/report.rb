module Checkr
  class Report < APIResource

    attribute :status
    attribute :values
    attribute :completed_at
    attribute :turnaround_time
    attribute :package
    attribute :values
    attribute :candidate, :Candidate
    attribute_writer_alias :candidate_id, :candidate

    attribute :ssn_trace, :SSNTrace
    attribute_writer_alias :ssn_trace_id, :ssn_trace

    attribute :eviction_search, :EvictionSearch
    attribute_writer_alias :eviction_search_id, :eviction_search

    attribute :sex_offender_search, :SexOffenderSearch
    attribute_writer_alias :sex_offender_search_id, :sex_offender_search

    attribute :national_criminal_search, :NationalCriminalSearch
    attribute_writer_alias :national_criminal_search_id, :national_criminal_search

    attribute :terrorist_watchlist_search, :TerroristWatchlistSearch
    attribute_writer_alias :terrorist_watchlist_search_id, :terrorist_watchlist_search

    attribute :global_watchlist_search, :GlobalWatchlistSearch
    attribute_writer_alias :global_watchlist_search_id, :global_watchlist_search

    attribute :county_criminal_searches, APIList.constructor(:CountyCriminalSearch)
    attribute_writer_alias :county_criminal_search_ids, :county_criminal_searches

    attribute :motor_vehicle_report, :MotorVehicleReport
    attribute_writer_alias :motor_vehicle_report_id, :motor_vehicle_report

    attribute :documents, APIList.constructor(:Document)
    attribute_writer_alias :document_ids, :documents

    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]
    api_class_method :create, :post

    api_instance_method :save, :post, :default_params => :changed_attributes

    def self.path
      "/v1/reports"
    end

    APIClass.register_subclass(self, "report")
  end
end

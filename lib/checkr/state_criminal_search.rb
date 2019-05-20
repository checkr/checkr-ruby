module Checkr
  class StateCriminalSearch < APIResource

    attribute :status
    attribute :completed_at
    attribute :turnaround_time
    attribute :state
    attribute :records
    attribute :filtered_by_positive_adjudication_records
    attribute :estimated_completion_date
    attribute :estimated_completion_time

    api_class_method :retrieve, :get, ':path/:id', arguments: [:id]

    def self.path
      '/v1/state_criminal_searches'
    end

    APIClass.register_subclass(self, 'state_criminal_search')

  end
end

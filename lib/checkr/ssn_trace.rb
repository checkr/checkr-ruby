module Checkr
  class SSNTrace < APIResource

    attribute :status
    attribute :completed_at
    attribute :turnaround_time
    attribute :ssn
    attribute :addresses

    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]

    def self.path
      "/v1/ssn_traces"
    end

    APIClass.register_subclass(self, "ssn_trace")
  end
end

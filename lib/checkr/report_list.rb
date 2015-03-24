module Checkr
  class ReportList < APIList

    attr_accessor :parent

    api_instance_method :create, :post, :constructor => :Report, :default_params => :create_defaults, :arguments => [:package]

    def self.construct(json, parent=nil)
      lambda = constructor(:Report)
      instance = lambda.call(json)
      instance.parent = parent if parent
      instance.clear_changed_attributes
      instance
    end

    def path
      "/v1/reports"
    end

    def create_defaults
      {
        :candidate_id => parent.id
      }
    end

  end
end

module Checkr
  class AdverseAction < APIResource
    attribute :status
    attribute :report_id
    attribute :post_notice_scheduled_at
    attribute :post_notice_ready_at
    attribute :canceled_at
    attribute :individualized_assessment_engaged
    attribute :adverse_items, APIList.constructor(:AdverseItem)

    api_class_method :all, :get, '/v1/reports/:report_id/adverse_actions', :constructor => APIList.constructor(:AdverseAction)
    api_class_method :create, :post, '/v1/reports/:report_id/adverse_actions'
    api_class_method :retrieve, :get, ':path/:id', :arguments => [:id]
    api_class_method :cancel, :delete, ':path/:id', :arguments => [:id]

    api_instance_method :cancel, :delete

    def self.path
      '/v1/adverse_actions'
    end

    APIClass.register_subclass(self, 'adverse_action')
  end
end

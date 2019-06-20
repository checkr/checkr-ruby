module Checkr
  class AdverseItem < APIResource
    attribute :text

    api_class_method :all, :get, '/v1/reports/:report_id/adverse_items', :constructor => APIList.constructor(:AdverseItem)

    APIClass.register_subclass(self, 'adverse_item')
  end
end

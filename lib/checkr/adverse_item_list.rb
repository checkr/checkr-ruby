module Checkr
  class AdverseItemList < APIList

    attribute :next_href
    attribute :previous_href
    attribute :count
    attr_accessor :parent

    api_instance_method :all, :get

    def self.construct(json, parent=nil)
      lambda = constructor(:AdverseItem)
      instance = lambda.call(json)
      instance.parent = parent if parent
      instance.clear_changed_attributes
      instance
    end

    def path
      parent.path + '/adverse_items'
    end

  end
end

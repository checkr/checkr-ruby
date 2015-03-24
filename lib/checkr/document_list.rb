module Checkr
  class DocumentList < APIList

    attribute :next_href
    attribute :previous_href
    attribute :count
    attr_accessor :parent

    api_instance_method :all, :get
    api_instance_method :create, :post, :constructor => :Document

    def self.construct(json, parent=nil)
      lambda = constructor(:Document)
      instance = lambda.call(json)
      instance.parent = parent if parent
      instance.clear_changed_attributes
      instance
    end

    def path
      parent.path + "/documents"
    end

  end
end

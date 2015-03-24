module Checkr
  class Geo < APIResource

    attribute :name
    attribute :state

    api_class_method :all, :get, :constructor => APIList.constructor(:Geo)
    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]
    api_class_method :create, :post

    api_instance_method :delete, :delete

    def self.path
      "/v1/geos"
    end

    APIClass.register_subclass(self, "geo")
  end
end

module Checkr
  class Package < APIResource

    attribute :name
    attribute :slug
    attribute :price
    attribute :screenings
    attribute :requires_invitation

    api_class_method :all, :get, :constructor => APIList.constructor(:Package)
    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]
    api_class_method :create, :post

    def self.path
      "/v1/packages"
    end

    APIClass.register_subclass(self, 'package')
  end
end

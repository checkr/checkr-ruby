module Checkr
  class Program < APIResource

    attribute :name
    attribute :created_at
    attribute :deleted_at
    attribute :geos, APIList.constructor(:Geo)
    attribute_writer_alias :geo_ids, :geos
    attribute :packages, APIList.constructor(:Package)
    attribute_writer_alias :package_ids, :packages

    api_class_method :all, :get, :constructor => APIList.constructor(:Program)
    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]

    def self.path
      "/v1/programs"
    end

    APIClass.register_subclass(self, 'program')
  end
end

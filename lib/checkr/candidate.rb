module Checkr
  class Candidate < APIResource

    attribute :first_name
    attribute :middle_name
    attribute :no_middle_name
    attribute :last_name
    attribute :email
    attribute :phone
    attribute :zipcode
    attribute :dob
    attribute :ssn
    attribute :driver_license_number
    attribute :driver_license_state
    attribute :previous_driver_license_number
    attribute :previous_driver_license_state
    attribute :copy_requested
    attribute :custom_id
    attribute :reports, :ReportList, :nested => true
    attribute_writer_alias :report_ids, :reports
    attribute :geo_ids
    attribute :documents, :DocumentList, :nested => true, :default => {}
    attribute_writer_alias :document_ids, :documents

    api_class_method :all, :get, :constructor => APIList.constructor(:Candidate)
    api_class_method :create, :post
    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id, :client]

    api_instance_method :save, :post, :default_params => :changed_attributes

    def geos
      APIList.constructor(:Geo).call(geo_ids)
    end

    def self.path
      "/v1/candidates"
    end

    APIClass.register_subclass(self, "candidate")
  end
end

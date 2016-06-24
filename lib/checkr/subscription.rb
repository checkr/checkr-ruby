module Checkr
  class Subscription < APIResource

    attribute :status
    attribute :values
    attribute :canceled_at
    attribute :package
    attribute :values
    attribute :interval_count
    attribute :interval_unit
    attribute :values
    attribute :start_date
    attribute :candidate, :Candidate
    attribute_writer_alias :candidate_id, :candidate

    api_class_method :all, :get, :constructor => APIList.constructor(:Subscription)
    api_class_method :retrieve, :get, ":path/:id", :arguments => [:id]
    api_class_method :create, :post

    api_instance_method :cancel, :delete

    def self.path
      "/v1/subscriptions"
    end

    APIClass.register_subclass(self, "subscription")
  end
end

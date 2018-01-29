module Checkr
  class Verification < APIResource

    attribute :verification_type
    attribute :verification_url
    attribute :completed_at

    api_class_method :all, :get, "/v1/reports/:report_id/verifications", :constructor => :VerificationList

    APIClass.register_subclass(self, "verification")
  end
end

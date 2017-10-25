module Checkr
  class Document < APIResource

    attribute :download_uri
    attribute :filesize
    attribute :filename
    attribute :content_type
    attribute :type

    api_class_method :all, :get, "/v1/candidates/:candidate_id/documents", :constructor => :DocumentList
    api_class_method :create, :post, "/v1/candidates/:candidate_id/documents"

    # Method #create and #all are all on the Candidate instance

    APIClass.register_subclass(self, "document")
  end
end

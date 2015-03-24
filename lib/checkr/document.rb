module Checkr
  class Document < APIResource

    attribute :download_uri
    attribute :filesize
    attribute :filename
    attribute :content_type

    # Method #create and #all are all on the Candidate instance

    APIClass.register_subclass(self, "document")
  end
end

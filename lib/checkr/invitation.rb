module Checkr
  class Invitation < APIResource

    attribute :uri
    attribute :invitation_url
    attribute :status
    attribute :created_at
    attribute :expires_at
    attribute :completed_at
    attribute :deleted_at
    attribute :package
    attribute :candidate, :Candidate
    attribute_writer_alias :candidate_id, :candidate

    api_class_method :all, :get,
                     constructor: APIList.constructor(:Invitation)
    api_class_method :retrieve, :get, ':path/:id', arguments: [:id]
    api_class_method :create, :post
    api_class_method :cancel, :delete, ':path/:id', arguments: [:id]

    def self.path
      '/v1/invitations'
    end

    APIClass.register_subclass(self, 'invitation')

  end
end

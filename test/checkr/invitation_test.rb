require File.expand_path('../../test_helper', __FILE__)
require 'active_support'
require 'active_support/core_ext/object/to_query'

module Checkr
  class InvitationTest < Test::Unit::TestCase

    setup do
      @inviation_url = "#{Checkr.api_base}/v1/invitations"
    end

    context 'Invitation class' do
      should 'be listable' do
        params = {
          candidate_id: '2c8447d8c35761ad8f70d9d3',
          package: 'mvr'
        }
        @mock.expects(:get).once.with("#{@inviation_url}?#{params.to_query}", anything, anything)
          .returns(test_response([test_invitation]))
        document = Checkr::Invitation.all(params)
        assert(document.is_a?(APIList))
        assert(document.data[0].id, test_invitation[:id])
      end

      should 'be retrieveable' do
        id = 'invitation_id'
        @mock.expects(:get).once.with("#{@inviation_url}/#{id}", anything, anything)
          .returns(test_response(test_invitation))
        invitation = Checkr::Invitation.retrieve(id)
        assert(invitation.is_a?(Invitation))
        assert(invitation.candidate.is_a?(Candidate))
      end

      should 'be createable' do
        @mock.expects(:post).once.with(@inviation_url, anything, test_invitation)
          .returns(test_response(test_invitation))
        invitation = Checkr::Invitation.create(test_invitation)
        assert(invitation.is_a?(Invitation))
        assert_equal(test_invitation[:id], invitation.id)
      end

      should 'be cancelable' do
        id = '2c8447d8c35761ad8f70d9d3'
        @mock.expects(:delete).once.with("#{@inviation_url}/#{id}", anything, anything)
          .returns(test_response(test_invitation))
        invitation = Checkr::Invitation.cancel(test_invitation[:id])
        assert(invitation.is_a?(Invitation))
        assert_equal(test_invitation[:id], invitation.id)
      end
    end

    context 'Retrieved Invitation instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_invitation))
        @invitation = Checkr::Invitation.retrieve('invitation_id')
      end

      should 'have the id attribute' do
        assert_equal(test_invitation[:id], @invitation.id)
      end

      should 'have the status attribute' do
        assert_equal(test_invitation[:status], @invitation.status)
      end

      should 'have the uri attribute' do
        assert_equal(test_invitation[:uri], @invitation.uri)
      end

      should 'have the invitation_url attribute' do
        assert_equal(test_invitation[:invitation_url], @invitation.invitation_url)
      end

      should 'have the completed_at attribute' do
        assert_equal(test_invitation[:completed_at], @invitation.completed_at)
      end

      should 'have the deleted_at attribute' do
        assert_equal(test_invitation[:deleted_at], @invitation.deleted_at)
      end

      should 'have the expires_at attribute' do
        assert_equal(test_invitation[:expires_at], @invitation.expires_at)
      end

      should 'have the package attribute' do
        assert_equal(test_invitation[:package], @invitation.package)
      end

      should 'have the object attribute' do
        assert_equal(test_invitation[:object], @invitation.object)
      end

      should 'have the created_at attribute' do
        assert_equal(test_invitation[:created_at], @invitation.created_at)
      end

      should 'have the candidate_id attribute' do
        assert_equal(test_invitation[:candidate_id], @invitation.candidate.id)
        assert(@invitation.candidate.is_a?(Candidate))
      end
    end

  end
end

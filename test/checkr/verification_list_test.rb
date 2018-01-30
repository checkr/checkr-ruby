require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class VerificationListTest < Test::Unit::TestCase
    setup do
      @report = Report.construct(test_report)
      @verification_url = "#{Checkr.api_base}#{@report.path}/verifications"
    end

    context 'VerificationList class' do
      should 'be listable' do
        @mock.expects(:get).once.with(@verification_url, anything, anything).returns(test_response(test_verification_list))

        verifications = @report.verifications.all

        assert(verifications.is_a?(VerificationList))
        verifications.each do |document|
          assert(document.is_a?(Verification))
        end
        assert(verifications.length > 0)
      end
    end

  end
end

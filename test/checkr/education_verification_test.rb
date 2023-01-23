require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class EducationVerificationTest < Test::Unit::TestCase
    setup do
      @education_verification_url = "#{Checkr.api_base}/v1/education_verifications"
    end

    context 'EducationVerification class' do
      should 'be retrieveable' do
        id = "education_verification_id"
        @mock.expects(:get).once.with("#{@education_verification_url}/#{id}", anything, anything)
          .returns(test_response(test_education_verification))
        education_verification = EducationVerification.retrieve(id)
        assert(education_verification.is_a?(EducationVerification))
      end
    end

    context 'EducationVerification instance' do
      should 'be refreshable' do
        @mock.expects(:get).once
          .with("#{@education_verification_url}/#{test_education_verification[:id]}",
                anything, anything)
          .returns(test_response(test_education_verification))
        education_verification = EducationVerification.new(test_education_verification[:id])
        education_verification.refresh
        assert_equal(test_education_verification[:status], education_verification.status)
      end
    end


    context 'Retrieved EducationVerification instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_education_verification))
        @education_verification = EducationVerification.retrieve('education_verification_id')
      end

      should 'have the id attribute' do
        assert_equal(test_education_verification[:id], @education_verification.id)
      end

      should 'have the object attribute' do
        assert_equal(test_education_verification[:object], @education_verification.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_education_verification[:uri], @education_verification.uri)
      end

      should 'have the status attribute' do
        assert_equal(test_education_verification[:status], @education_verification.status)
      end

      should 'have the result attribute' do
        assert_equal(test_education_verification[:result], @education_verification.result)
      end

      should 'have the cancellation_reason attribute' do
        assert_equal(test_education_verification[:cancellation_reason], @education_verification.cancellation_reason)
      end

      should 'have the cancellation_reason_description attribute' do
        assert_equal(test_education_verification[:cancellation_reason_description], @education_verification.cancellation_reason_description)
      end

      should 'have the includes_canceled attribute' do
        assert_equal(test_education_verification[:includes_canceled], @education_verification.includes_canceled)
      end

      should 'have the created_at attribute' do
        assert_equal(test_education_verification[:created_at],
                     @education_verification.created_at)
      end

      should 'have the completed_at attribute' do
        assert_equal(test_education_verification[:completed_at],
                     @education_verification.completed_at)
      end

      should 'have the turnaround_time attribute' do
        assert_equal(test_education_verification[:turnaround_time],
                     @education_verification.turnaround_time)
      end

      should 'have the records attribute' do
        assert_equal(test_education_verification[:records], @education_verification.records)
      end

    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(EducationVerification))
      assert_equal(EducationVerification, APIClass.subclass_fetch("education_verification"))
    end

  end
end

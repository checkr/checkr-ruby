require File.expand_path('../test_helper', __dir__)

module Checkr
  class EmploymentVerificationTest < Test::Unit::TestCase

    setup do
      @employment_verification_url = "#{Checkr.api_base}/v1/employment_verifications"
    end

    context 'EmploymentVerification class' do
      should 'be retrieveable' do
        id = 'employment_verification_id'
        @mock.expects(:get).once.with("#{@employment_verification_url}/#{id}", anything, anything)
          .returns(test_response(test_employment_verification))
        employment_verification = EmploymentVerification.retrieve(id)
        assert(employment_verification.is_a?(EmploymentVerification))
      end
    end

    context 'EmploymentVerification instance' do
      should 'be refreshable' do
        @mock.expects(:get).once
          .with("#{@employment_verification_url}/#{test_employment_verification[:id]}",
                anything, anything)
          .returns(test_response(test_employment_verification))
        employment_verification = EmploymentVerification.new(test_employment_verification[:id])
        employment_verification.refresh
        assert_equal(test_employment_verification[:status], employment_verification.status)
      end
    end

    context 'Retrieved EmploymentVerification instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_employment_verification))
        @employment_verification = EmploymentVerification.retrieve('employment_verification_id')
      end

      should 'have the id attribute' do
        assert_equal(test_employment_verification[:id], @employment_verification.id)
      end

      should 'have the object attribute' do
        assert_equal(test_employment_verification[:object], @employment_verification.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_employment_verification[:uri], @employment_verification.uri)
      end

      should 'have the status attribute' do
        assert_equal(test_employment_verification[:status], @employment_verification.status)
      end

      should 'have the result attribute' do
        assert_equal(test_employment_verification[:result], @employment_verification.result)
      end

      should 'have the cancellation_reason attribute' do
        assert_equal(test_employment_verification[:cancellation_reason], @employment_verification.cancellation_reason)
      end

      should 'have the cancellation_reason_description attribute' do
        assert_equal(test_employment_verification[:cancellation_reason_description], @employment_verification.cancellation_reason_description)
      end

      should 'have the includes_canceled attribute' do
        assert_equal(test_employment_verification[:includes_canceled], @employment_verification.includes_canceled)
      end

      should 'have the created_at attribute' do
        assert_equal(test_employment_verification[:created_at],
                     @employment_verification.created_at)
      end

      should 'have the completed_at attribute' do
        assert_equal(test_employment_verification[:completed_at],
                     @employment_verification.completed_at)
      end

      should 'have the turnaround_time attribute' do
        assert_equal(test_employment_verification[:turnaround_time],
                     @employment_verification.turnaround_time)
      end

      should 'have the records attribute' do
        assert_equal(test_employment_verification[:records], @employment_verification.records)
      end
    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(EmploymentVerification))
      assert_equal(EmploymentVerification, APIClass.subclass_fetch('employment_verification'))
    end

  end
end

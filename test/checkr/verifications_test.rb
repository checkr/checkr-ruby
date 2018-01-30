require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class VerificationTest < Test::Unit::TestCase
    setup do
      @report = Report.construct(test_report)
      @verification_url = "#{Checkr.api_base}#{@report.path}/verifications"
    end

    context 'Constructed Verification instance' do
      setup do
        @verification = Verification.construct(test_verification)
      end

      should 'have the id attribute' do
        assert_equal(test_verification[:id], @verification.id)
      end

      should 'have the object attribute' do
        assert_equal(test_verification[:object], @verification.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_verification[:uri], @verification.uri)
      end

      should 'have the created_at attribute' do
        assert_equal(test_verification[:created_at], @verification.created_at)
      end

      should 'have the completed_at attribute' do
        assert_equal(test_verification[:completed_at], @verification.completed_at)
      end

      should 'have the verification_type attribute' do
        assert_equal(test_verification[:verification_type], @verification.verification_type)
      end

      should 'have the verification_url attribute' do
        assert_equal(test_verification[:verification_url], @verification.verification_url)
      end
    end

    context '#all' do
      should 'return instances of Verification' do
        @mock.expects(:get).once.with(@verification_url, anything, anything)
            .returns(test_response(test_verification_list))
        assert_equal(@report.verifications.all.first.class, Verification)
      end
    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(Verification))
      assert_equal(Verification, APIClass.subclass_fetch('verification'))
    end

  end
end

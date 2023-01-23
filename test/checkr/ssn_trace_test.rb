require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class SSNTraceTest < Test::Unit::TestCase
    setup do
      @ssn_trace_url = "#{Checkr.api_base}/v1/ssn_traces"
    end

    context 'SSNTrace class' do
      should 'be retrieveable' do
        id = "ssn_trace_id"
        @mock.expects(:get).once.with("#{@ssn_trace_url}/#{id}", anything, anything).returns(test_response(test_ssn_trace))
        ssn_trace = SSNTrace.retrieve(id)
        assert(ssn_trace.is_a?(SSNTrace))
      end
    end

    context 'SSNTrace instance' do
      should 'be refreshable' do
        @mock.expects(:get).once.with("#{@ssn_trace_url}/#{test_ssn_trace[:id]}", anything, anything).returns(test_response(test_ssn_trace))
        ssn_trace = SSNTrace.new(test_ssn_trace[:id])
        ssn_trace.refresh
        assert_equal(test_ssn_trace[:status], ssn_trace.status)
      end
    end


    context 'Retrieved SSNTrace instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_ssn_trace))
        @ssn_trace = SSNTrace.retrieve('ssn_trace_id')
      end

      should 'have the id attribute' do
        assert_equal(test_ssn_trace[:id], @ssn_trace.id)
      end

      should 'have the object attribute' do
        assert_equal(test_ssn_trace[:object], @ssn_trace.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_ssn_trace[:uri], @ssn_trace.uri)
      end

      should 'have the status attribute' do
        assert_equal(test_ssn_trace[:status], @ssn_trace.status)
      end

      should 'have the result attribute' do
        assert_equal(test_ssn_trace[:result], @ssn_trace.result)
      end

      should 'have the cancellation_reason attribute' do
        assert_equal(test_ssn_trace[:cancellation_reason], @ssn_trace.cancellation_reason)
      end

      should 'have the cancellation_reason_description attribute' do
        assert_equal(test_ssn_trace[:cancellation_reason_description], @ssn_trace.cancellation_reason_description)
      end

      should 'have the created_at attribute' do
        assert_equal(test_ssn_trace[:created_at], @ssn_trace.created_at)
      end

      should 'have the completed_at attribute' do
        assert_equal(test_ssn_trace[:completed_at], @ssn_trace.completed_at)
      end

      should 'have the turnaround_time attribute' do
        assert_equal(test_ssn_trace[:turnaround_time], @ssn_trace.turnaround_time)
      end

      should 'have the ssn attribute' do
        assert_equal(test_ssn_trace[:ssn], @ssn_trace.ssn)
      end

      should 'have the addresses attribute' do
        assert_equal(test_ssn_trace[:addresses], @ssn_trace.addresses)
      end

    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(SSNTrace))
      assert_equal(SSNTrace, APIClass.subclass_fetch("ssn_trace"))
    end

  end
end

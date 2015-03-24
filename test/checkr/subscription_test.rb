require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class SubscriptionTest < Test::Unit::TestCase
    setup do
      @subscription_url = "#{Checkr.api_base}/v1/subscriptions"
    end

    context 'Subscription class' do
      should 'be retrieveable' do
        id = "subscription_id"
        @mock.expects(:get).once.with("#{@subscription_url}/#{id}", anything, anything).returns(test_response(test_subscription))
        subscription = Subscription.retrieve(id)
        assert(subscription.is_a?(Subscription))
      end

      should 'be createable' do
        @mock.expects(:post).once.with(@subscription_url, anything, test_subscription).returns(test_response(test_subscription))
        subscription = Subscription.create(test_subscription)
        assert(subscription.is_a?(Subscription))
        assert_equal(test_subscription[:id], subscription.id)
      end
    end

    context 'Subscription instance' do
      should 'be refreshable' do
        @mock.expects(:get).once.with("#{@subscription_url}/#{test_subscription[:id]}", anything, anything).returns(test_response(test_subscription))
        subscription = Subscription.new(test_subscription[:id])
        subscription.refresh
        assert_equal(test_subscription[:package], subscription.package)
      end

      should 'be cancelable' do
        @mock.expects(:delete).once.with("#{@subscription_url}/#{test_subscription[:id]}", anything, anything).returns(test_response(test_subscription))
        subscription = Subscription.new(test_subscription[:id])
        subscription.cancel
      end
    end


    context 'Retrieved Subscription instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_subscription))
        @subscription = Subscription.retrieve('subscription_id')
      end

      should 'have the id attribute' do
        assert_equal(test_subscription[:id], @subscription.id)
      end

      should 'have the object attribute' do
        assert_equal(test_subscription[:object], @subscription.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_subscription[:uri], @subscription.uri)
      end

      should 'have the status attribute' do
        assert_equal(test_subscription[:status], @subscription.status)
      end

      should 'have the created_at attribute' do
        assert_equal(test_subscription[:created_at], @subscription.created_at)
      end

      should 'have the canceled_at attribute' do
        assert_equal(test_subscription[:canceled_at], @subscription.canceled_at)
      end

      should 'have the package attribute' do
        assert_equal(test_subscription[:package], @subscription.package)
      end

      should 'have the interval_count attribute' do
        assert_equal(test_subscription[:interval_count], @subscription.interval_count)
      end

      should 'have the start_date attribute' do
        assert_equal(test_subscription[:start_date], @subscription.start_date)
      end

      should 'have the candidate attribute' do
        assert_equal(test_subscription[:candidate_id], @subscription.candidate.id)
        assert(@subscription.candidate.is_a?(Candidate))
      end

    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(Subscription))
      assert_equal(Subscription, APIClass.subclass_fetch("subscription"))
    end

  end
end

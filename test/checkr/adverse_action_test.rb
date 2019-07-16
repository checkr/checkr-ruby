require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class AdverseActionTest < Test::Unit::TestCase
    setup do
      @adverse_action_url = "#{Checkr.api_base}#{AdverseAction.path}"
    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(AdverseAction))
      assert_equal(AdverseAction, APIClass.subclass_fetch('adverse_action'))
    end

    context 'Constructed AdverseAction instance' do
      setup do
        @adverse_action = AdverseAction.construct(test_adverse_action)
      end

      [
        :id,
        :object,
        :uri,
        :created_at,
        :status,
        :report_id,
        :post_notice_scheduled_at,
        :post_notice_ready_at,
        :canceled_at,
        :individualized_assessment_engaged,
      ].each do |attribute|
        should "have the #{attribute.to_s} attribute" do
          assert_equal(test_adverse_action[attribute], @adverse_action.public_send(attribute))
        end
      end
    end

    context '.create' do
      setup do
        @report = Report.construct(test_report)
        @create_url = "#{Checkr.api_base}#{Report.path}/#{@report.id}/adverse_actions"
      end

      should 'creates an instance of AdverseAction' do
        @mock.expects(:post).once.with(@create_url, anything, anything)
            .returns(test_response(test_adverse_action))

        adverse_action = AdverseAction.create({ :report_id => @report.id })

        assert(adverse_action.is_a?(AdverseAction))
        assert_equal(test_adverse_action[:id], adverse_action.id)
      end
    end

    context '.retrieve' do
      setup do
        @id = test_adverse_action[:id]
        @retrieve_url = "#{Checkr.api_base}#{AdverseAction.path}/#{@id}"
      end

      should 'fetches an instance of AdverseAction' do
        @mock.expects(:get).once.with(@retrieve_url, anything, anything)
          .returns(test_response(test_adverse_action))

        adverse_action = AdverseAction.retrieve(@id)

        assert(adverse_action.is_a?(AdverseAction))
        assert_equal(@id, adverse_action.id)
      end
    end

    context '#cancel/.cancel' do
      setup do
        @id = test_adverse_action[:id]
        @cancel_url = "#{Checkr.api_base}#{AdverseAction.path}/#{@id}"
      end

      should 'cancels an instance of AdverseAction' do
        @mock.expects(:delete).twice.with(@cancel_url, anything, anything)
          .returns(test_response(test_adverse_action))

        adverse_action = AdverseAction.cancel(@id)
        assert(adverse_action.is_a?(AdverseAction))
        assert_equal(@id, adverse_action.id)

        adverse_action = AdverseAction.new(@id).cancel
        assert(adverse_action.is_a?(AdverseAction))
        assert_equal(@id, adverse_action.id)
      end
    end
  end
end

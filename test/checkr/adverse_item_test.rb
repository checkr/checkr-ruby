require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class AdverseItemTest < Test::Unit::TestCase
    setup do
      @report = Report.construct(test_report)
      @adverse_item_url = "#{Checkr.api_base}#{@report.path}/adverse_items"
    end

    context 'Constructed AdverseItem instance' do
      setup do
        @adverse_item = AdverseItem.construct(test_adverse_item)
      end

      [
        :id,
        :object,
        :uri,
        :created_at,
        :text,
      ].each do |attribute|
        should "have the #{attribute.to_s} attribute" do
          assert_equal(test_adverse_item[attribute], @adverse_item.public_send(attribute))
        end
      end
    end

    context '.all' do
      should 'return instances of AdverseItem' do
        @mock.expects(:get).once.with do |url, params, opts|
          url.start_with?(@adverse_item_url)
        end.returns(test_response(test_adverse_item_list))

        adverse_items = AdverseItem.all({ :report_id => @report.id })

        assert(adverse_items.is_a?(APIList))
        assert(adverse_items.length > 0)
        adverse_items.each do |adverse_item|
          assert(adverse_item.is_a?(AdverseItem))
        end
      end
    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(AdverseItem))
      assert_equal(AdverseItem, APIClass.subclass_fetch('adverse_item'))
    end
  end
end

require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class DocumentListTest < Test::Unit::TestCase
    setup do
      @candidate = Candidate.construct(test_candidate)
      @document_url = "#{Checkr.api_base}#{@candidate.path}/documents"
    end

    context 'DocumentList class' do
      should 'be createable' do
        new_doc = {
          :type => "driver_license",
          :file => "fake_file"
        }
        @mock.expects(:post).once.with(@document_url, anything, new_doc).returns(test_response(test_document))
        document = @candidate.documents.create(new_doc)
        assert(document.is_a?(Document))
        assert_equal(test_document[:id], document.id)
      end

      should 'be listable' do
        @mock.expects(:get).once.with(@document_url, anything, anything).returns(test_response(test_document_list))

        documents = @candidate.documents.all

        assert(documents.is_a?(DocumentList))
        documents.each do |document|
          assert(document.is_a?(Document))
        end
        assert(documents.length > 0)
      end
    end

  end
end

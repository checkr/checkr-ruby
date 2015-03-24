require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class DocumentTest < Test::Unit::TestCase
    setup do
      @candidate = Candidate.construct(test_candidate)
      @document_url = "#{Checkr.api_base}#{@candidate.path}/documents"
    end

    context 'Document class' do
      should 'be createable' do
        new_doc = {
          :type => "driver_license",
          :file => "fake_file",
          :candidate_id => @candidate.id
        }
        @mock.expects(:post).once.with(@document_url, anything, new_doc).returns(test_response(test_document))
        document = Checkr::Document.create(new_doc)
        assert(document.is_a?(Document))
        assert_equal(test_document[:id], document.id)
      end

      should 'be listable' do
        @mock.expects(:get).once.with do |url, params, opts|
          url.start_with?(@document_url)
        end.returns(test_response(test_document_list))

        documents = Checkr::Document.all({
          :candidate_id => @candidate.id
        })

        assert(documents.is_a?(DocumentList))
        documents.each do |document|
          assert(document.is_a?(Document))
        end
        assert(documents.length > 0)
      end
    end

    context 'Document instance' do
      # should 'be refreshable' do
      #   @mock.expects(:get).once.with("#{@document_url}/#{test_document[:id]}", anything, anything).returns(test_response(test_document))
      #   document = Document.new(test_document[:id])
      #   document.refresh
      #   assert_equal(test_document[:filename], document.filename)
      # end
    end


    context 'Constructed Document instance' do
      setup do
        @document = Document.construct(test_document)
      end

      should 'have the id attribute' do
        assert_equal(test_document[:id], @document.id)
      end

      should 'have the object attribute' do
        assert_equal(test_document[:object], @document.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_document[:uri], @document.uri)
      end

      should 'have the created_at attribute' do
        assert_equal(test_document[:created_at], @document.created_at)
      end

      should 'have the download_uri attribute' do
        assert_equal(test_document[:download_uri], @document.download_uri)
      end

      should 'have the filesize attribute' do
        assert_equal(test_document[:filesize], @document.filesize)
      end

      should 'have the filename attribute' do
        assert_equal(test_document[:filename], @document.filename)
      end

      should 'have the content_type attribute' do
        assert_equal(test_document[:content_type], @document.content_type)
      end

    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(Document))
      assert_equal(Document, APIClass.subclass_fetch("document"))
    end

  end
end

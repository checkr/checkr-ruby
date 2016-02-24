require File.expand_path('../../test_helper', __FILE__)

module Checkr
  class CandidateTest < Test::Unit::TestCase
    setup do
      @candidate_url = "#{Checkr.api_base}/v1/candidates"
    end

    context 'Candidate class' do
      should 'be retrieveable' do
        id = "candidate_id"
        @mock.expects(:get).once.with("#{@candidate_url}/#{id}", anything, anything).returns(test_response(test_candidate))
        candidate = Candidate.retrieve(id)
        assert(candidate.is_a?(Candidate))
      end

      should 'be createable' do
        @mock.expects(:post).once.with(@candidate_url, anything, test_candidate).returns(test_response(test_candidate))
        candidate = Candidate.create(test_candidate)
        assert(candidate.is_a?(Candidate))
        assert_equal(test_candidate[:id], candidate.id)
      end

      should 'be listable' do
        @mock.expects(:get).once.returns(test_response(test_candidate_list))

        candidates = Candidate.all

        assert(candidates.is_a?(APIList))
        candidates.each do |candidate|
          assert(candidate.is_a?(Candidate))
        end
      end
    end

    context 'Candidate instance' do
      should 'be refreshable' do
        @mock.expects(:get).once.with("#{@candidate_url}/#{test_candidate[:id]}", anything, anything).returns(test_response(test_candidate))
        candidate = Candidate.new(test_candidate[:id])
        candidate.refresh
        assert_equal(test_candidate[:email], candidate.email)
      end

      should 'be updateable' do
        candidate = Candidate.new(test_candidate)
        candidate.copy_requested = true

        @mock.expects(:post).once.with do |url, headers, params|
          params == candidate.changed_attributes && url == "#{@candidate_url}/#{candidate.id}"
        end.returns(test_response(test_candidate))

        # This should update this instance with test_candidate since it was returned
        candidate.save
        assert_equal(test_candidate[:copy_requested], candidate.copy_requested)
      end

      should 'include an empty documents list' do
        # TODO(joncalhoun): Implement this when test docs are available.

        # candidate = Candidate.new(test_candidate)
        # @mock.expects(:get).once.with("#{Checkr.api_base}#{Transaction.path}?candidate=#{candidate.id}", anything, anything).returns(test_response(test_transaction_list))

        # transactions = candidate.transactions
        # assert(transactions.is_a?(APIList))
        # transactions.each do |transaction|
        #   assert(transaction.is_a?(Transaction))
        # end
      end

      should 'include a filled documents list' do

      end
    end


    context 'Retrieved Candidate instance' do
      setup do
        @mock.expects(:get).once.returns(test_response(test_candidate))
        @candidate = Candidate.retrieve('candidate_id')
      end

      should 'have the id attribute' do
        assert_equal(test_candidate[:id], @candidate.id)
      end

      should 'have the object attribute' do
        assert_equal(test_candidate[:object], @candidate.object)
      end

      should 'have the uri attribute' do
        assert_equal(test_candidate[:uri], @candidate.uri)
      end

      should 'have the created_at attribute' do
        assert_equal(test_candidate[:created_at], @candidate.created_at)
      end

      should 'have the middle_name attribute' do
        assert_equal(test_candidate[:middle_name], @candidate.middle_name)
      end

      should 'have the last_name attribute' do
        assert_equal(test_candidate[:last_name], @candidate.last_name)
      end

      should 'have the email attribute' do
        assert_equal(test_candidate[:email], @candidate.email)
      end

      should 'have the phone attribute' do
        assert_equal(test_candidate[:phone], @candidate.phone)
      end

      should 'have the zipcode attribute' do
        assert_equal(test_candidate[:zipcode], @candidate.zipcode)
      end

      should 'have the dob attribute' do
        assert_equal(test_candidate[:dob], @candidate.dob)
      end

      should 'have the ssn attribute' do
        assert_equal(test_candidate[:ssn], @candidate.ssn)
      end

      should 'have the driver_license_number attribute' do
        assert_equal(test_candidate[:driver_license_number], @candidate.driver_license_number)
      end

      should 'have the driver_license_state attribute' do
        assert_equal(test_candidate[:driver_license_state], @candidate.driver_license_state)
      end

      should 'have the previous_driver_license_number attribute' do
        assert_equal(test_candidate[:previous_driver_license_number], @candidate.previous_driver_license_number)
      end

      should 'have the previous_driver_license_state attribute' do
        assert_equal(test_candidate[:previous_driver_license_state], @candidate.previous_driver_license_state)
      end

      should 'have the copy_requested attribute' do
        assert_equal(test_candidate[:copy_requested], @candidate.copy_requested)
      end

      should 'have the adjudication attribute' do
        assert_equal(test_candidate[:adjudication], @candidate.adjudication)
      end

      should 'have the custom_id attribute' do
        assert_equal(test_candidate[:custom_id], @candidate.custom_id)
      end

      should 'have the reports attribute' do
        assert_equal(test_candidate[:report_ids], @candidate.reports.json)
        assert(@candidate.reports.is_a?(APIList))
      end

      should 'have the geos attribute' do
        assert_equal(test_candidate[:geo_ids], @candidate.geos.json)
        assert(@candidate.geos.is_a?(APIList))
      end

      should 'have the documents attribute' do
        assert(!@candidate.documents.any?)
        assert(@candidate.documents.is_a?(DocumentList))
      end

    end

    should 'be registered' do
      assert(APIClass.subclasses.include?(Candidate))
      assert_equal(Candidate, APIClass.subclass_fetch("candidate"))
    end

  end
end

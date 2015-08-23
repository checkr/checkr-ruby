module Checkr
  module TestData

    def test_response(body, code=200)
      # When an exception is raised, restclient clobbers method_missing.  Hence we
      # can't just use the stubs interface.
      body = JSON.generate(body) if !(body.kind_of? String)
      m = mock
      m.instance_variable_set('@checkr_values', { :body => body, :code => code })
      def m.body; @checkr_values[:body]; end
      def m.code; @checkr_values[:code]; end
      m
    end

    def test_mock_resource
      {
        :object => 'mock_resource',
        :name => 'test mr name',
        :nested => {
          :id => 'test_nested_id',
          :object => 'nested_resource',
          :price => 500
        },
        :nested_alt_id => 'nested_alt_id',
        :nested_with => {
          :id => 'nested_with_id',
          :price => 500
        },
        :thash => { :some_key => "some value" },
        :tarray => ["abc", "xyz"],
        :id => 'test_mock_resource_id'
      }
    end

    def test_mock_resource_list
      {
        :object => 'list',
        :data => [test_mock_resource, test_mock_resource, test_mock_resource],
      }
    end


    def test_candidate
      {:id=>"e44aa283528e6fde7d542194",
       :object=>"candidate",
       :uri=>"/v1/candidates/e44aa283528e6fde7d542194",
       :created_at=>"2014-01-18T12:34:00Z",
       :first_name=>"John",
       :middle_name=>"Alfred",
       :last_name=>"Smith",
       :email=>"john.smith@gmail.com",
       :phone=>"5555555555",
       :zipcode=>"90401",
       :dob=>"1970-01-22",
       :ssn=>"XXX-XX-4645",
       :driver_license_number=>"F211165",
       :driver_license_state=>"CA",
       :previous_driver_license_number=>"F1501739",
       :previous_driver_license_state=>"CA",
       :copy_requested=>false,
       :adjudication=>nil,
       :custom_id=>nil,
       :report_ids=>["532e71cfe88a1d4e8d00000d"],
       :geo_ids=>["79f943e212cce7de21c054a8", "7299c2c22ebb19abb0688a6c"]}
    end

    def test_candidate_list
      {
        :object => 'list',
        :data => [test_candidate, test_candidate, test_candidate],
      }
    end

    def test_report
      {:id=>"4722c07dd9a10c3985ae432a",
       :object=>"report",
       :uri=>"/v1/reports/4722c07dd9a10c3985ae432a",
       :status=>"clear",
       :created_at=>"2014-01-18T12:34:00Z",
       :completed_at=>"2014-01-18T12:35:30Z",
       :turnaround_time=>90,
       :package=>"driver_plus",
       :candidate_id=>"e44aa283528e6fde7d542194",
       :ssn_trace_id=>"539fd88c101897f7cd000001",
       :sex_offender_search_id=>"539fd88c101897f7cd000008",
       :national_criminal_search_id=>"539fd88c101897f7cd000006",
       :terrorist_watchlist_search_id=>"53f11ec23934620002010000",
       :county_criminal_search_ids=>
        ["539fdcf335644a0ef4000001", "532e71cfe88a1d4e8d00000i"],
       :motor_vehicle_report_id=>"539fd88c101897f7cd000007",
     	 :eviction_search_id=>"539fd88c101897f7cd000008"}
    end

    def test_report_list
      {
        :object => 'list',
        :data => [test_report, test_report, test_report],
      }
    end

    def test_subscription
      {:id=>"4722c07dd9a10c3985ae432a",
       :object=>"subscription",
       :uri=>"/v1/subscriptions/4722c07dd9a10c3985ae432a",
       :status=>"active",
       :created_at=>"2014-01-18T12:34:00Z",
       :canceled_at=>nil,
       :package=>"driver_plus",
       :interval_count=>1,
       :interval_unit=>"month",
       :start_date=>"2014-06-10",
       :candidate_id=>"e44aa283528e6fde7d542194"}
    end

    def test_geo
      {:id=>"e44aa283528e6fde7d542194",
       :object=>"geo",
       :uri=>"/v1/geos/e44aa283528e6fde7d542194",
       :created_at=>"2015-01-18T12:34:00Z",
       :name=>"San Francisco",
       :state=>"CA"}
    end

    def test_ssn_trace
      {:id=>"539fd88c101897f7cd000001",
       :object=>"ssn_trace",
       :uri=>"/v1/ssn_traces/539fd88c101897f7cd000001",
       :status=>"clear",
       :created_at=>"2014-01-18T12:34:00Z",
       :completed_at=>"2014-01-18T12:35:30Z",
       :turnaround_time=>90,
       :ssn=>"XXX-XX-4645",
       :addresses=>
        [{:street=>"123 S Folsom St",
          :unit=>"Apt 54B",
          :city=>"San Francisco",
          :state=>"CA",
          :zipcode=>"94110",
          :county=>"SAN FRANCISCO",
          :from_date=>"2010-05-01",
          :to_date=>"2014-06-01"},
         {:street=>"1230 5th Avenue",
          :unit=>nil,
          :city=>"New York",
          :state=>"NY",
          :zipcode=>"1005",
          :county=>"NEW YORK",
          :from_date=>"2007-07-01",
          :to_date=>"2010-05-01"}]}
    end

    def test_sex_offender_search
      {:id=>"539fd88c101897f7cd000008",
       :object=>"sex_offender_search",
       :uri=>"/v1/sex_offender_searches/539fd88c101897f7cd000008",
       :status=>"consider",
       :created_at=>"2014-01-18T12:34:00Z",
       :completed_at=>"2014-01-18T12:35:30Z",
       :turnaround_time=>90,
       :records=>
        [{:registry=>"California",
          :full_name=>"John Alfred Smith",
          :age=>44,
          :address=>
           {:street=>"123 S Folsom St",
            :city=>"San Francisco",
            :state=>"CA",
            :zipcode=>"94110"},
          :race=>"white",
          :gender=>"male",
          :eye_color=>"brown",
          :hair_color=>"brown",
          :height=>70,
          :weight=>175,
          :registration_start=>"2011-02-12",
          :registration_end=>"life registration",
          :photo=>"http://goo.gl/wk4X6f",
          :charges=>
           [{:charge=>"Sexual Assault Statute: 948.02(2)",
             :victim=>"Child",
             :classification=>nil,
             :disposition=>"Guilty",
             :deposition_date=>"2010-12-22"}]}]}
    end

    def test_terrorist_watchlist_search
      {:id=>"539fd88c101897f7cd000008",
       :object=>"terrorist_watchlist_search",
       :uri=>"/v1/terrorist_watchlist_searches/539fd88c101897f7cd000008",
       :status=>"consider",
       :created_at=>"2014-01-18T12:34:00Z",
       :completed_at=>"2014-01-18T12:35:30Z",
       :turnaround_time=>90,
       :records=>
        [{:case_number=>"24323-DA",
          :file_date=>nil,
          :arresting_agency=>"DEA Boston Division",
          :court_jurisdiction=>nil,
          :court_of_record=>nil,
          :dob=>"1970-01-22",
          :full_name=>"John Alfred Smith",
          :charges=>
           [{:charge=>"RICO murder",
             :charge_type=>nil,
             :charge_id=>nil,
             :classification=>"Felony",
             :deposition=>nil,
             :defendant=>nil,
             :plaintiff=>nil,
             :sentence=>"Active Punishment Minimum: 10Y",
             :disposition=>"Guilty",
             :probation_status=>nil,
             :offense_date=>"2011-04-22",
             :deposition_date=>"2014-05-27",
             :arrest_date=>nil,
             :charge_date=>nil,
             :sentence_date=>nil,
             :disposition_date=>"2011-06-02"}]}]}
    end

    def test_national_criminal_search
      {:id=>"539fd88c101897f7cd000006",
       :object=>"national_criminal_search",
       :uri=>"/v1/national_criminal_searches/539fd88c101897f7cd000006",
       :status=>"consider",
       :created_at=>"2014-01-18T12:34:00Z",
       :completed_at=>"2014-01-18T12:35:30Z",
       :turnaround_time=>90,
       :records=>
        [{:case_number=>"24323-DA",
          :file_date=>nil,
          :arresting_agency=>nil,
          :court_jurisdiction=>nil,
          :court_of_record=>nil,
          :dob=>"1970-01-22",
          :full_name=>"John Alfred Smith",
          :charges=>
           [{:charge=>"Sell Cocaine",
             :charge_type=>nil,
             :charge_id=>nil,
             :classification=>"Felony",
             :deposition=>nil,
             :defendant=>nil,
             :plaintiff=>nil,
             :sentence=>"Active Punishment Minimum: 10M",
             :disposition=>"Guilty",
             :probation_status=>nil,
             :offense_date=>"2011-04-22",
             :deposition_date=>"2014-05-27",
             :arrest_date=>nil,
             :charge_date=>nil,
             :sentence_date=>nil,
             :disposition_date=>"2011-06-02"}]}]}
    end

    def test_county_criminal_search
      {:id=>"539fdcf335644a0ef4000001",
       :object=>"county_criminal_search",
       :uri=>"/v1/county_criminal_searches/539fdcf335644a0ef4000001",
       :status=>"consider",
       :created_at=>"2014-01-18T12:34:00Z",
       :completed_at=>"2014-01-18T12:35:30Z",
       :turnaround_time=>100800,
       :county=>"SAN FRANCISCO",
       :state=>"CA",
       :records=>
        [{:case_number=>"24323-DA",
          :file_date=>"2010-02-18",
          :arresting_agency=>"San Francisco Police Department",
          :court_jurisdiction=>"San Francisco",
          :court_of_record=>nil,
          :dob=>"1970-01-22",
          :full_name=>"John Alfred Smith",
          :charges=>
           [{:charge=>"Sell Cocaine",
             :charge_type=>nil,
             :charge_id=>nil,
             :classification=>"Felony",
             :deposition=>nil,
             :defendant=>"John Alfred Smith",
             :plaintiff=>nil,
             :sentence=>"Active Punishment Minimum: 10M",
             :disposition=>"Guilty",
             :probation_status=>nil,
             :offense_date=>"2011-04-22",
             :deposition_date=>"2014-05-27",
             :arrest_date=>"2011-04-22",
             :charge_date=>nil,
             :sentence_date=>"2011-06-02",
             :disposition_date=>"2011-06-02"}]}]}
    end

    def test_motor_vehicle_report
      {:id=>"539fd88c101897f7cd000007",
       :object=>"motor_vehicle_report",
       :uri=>"/v1/motor_vehicle_reports/539fd88c101897f7cd000007",
       :status=>"consider",
       :created_at=>"2014-01-18T12:34:00Z",
       :completed_at=>"2014-01-18T12:35:30Z",
       :turnaround_time=>90,
       :full_name=>"John Alfred Smith",
       :license_number=>"F2111132",
       :license_state=>"CA",
       :license_status=>"valid",
       :license_type=>"non-commercial",
       :license_class=>"C",
       :expiration_date=>"2016-07-24",
       :issued_date=>"2006-12-03",
       :first_issued_date=>"2000-01-14",
       :inferred_issued_date=>nil,
       :restrictions=>nil,
       :accidents=>
        [{:accident_date=>"2009-04-12",
          :description=>"property damage",
          :city=>nil,
          :county=>"SAN FRANCISCO",
          :state=>nil,
          :order_number=>"33-435932",
          :points=>nil,
          :vehicle_speed=>nil,
          :reinstatement_date=>nil,
          :action_taken=>"police report filed",
          :ticket_number=>nil,
          :enforcing_agency=>"San Francisco PD",
          :jurisdiction=>nil,
          :severity=>nil,
          :violation_number=>nil,
          :license_plate=>"6UM6938",
          :fine_amount=>nil,
          :acd_code=>nil,
          :state_code=>nil,
          :injury_accident=>false,
          :fatality_accident=>false,
          :fatality_count=>0,
          :injury_count=>0,
          :vehicles_involved_count=>1,
          :report_number=>nil,
          :policy_number=>nil}],
       :violations=>
        [{:type=>"conviction",
          :issued_date=>"2011-11-14",
          :conviction_date=>"2010-04-11",
          :description=>"speeding 15-19 mph",
          :points=>0,
          :city=>nil,
          :county=>"SANTA CLARA",
          :state=>"California",
          :ticket_number=>"2D55555",
          :disposition=>nil,
          :category=>nil,
          :avd_category_id=>nil,
          :court_name=>nil,
          :acd_code=>nil,
          :state_code=>nil,
          :docket=>nil}]}
    end

    def test_eviction_search
      { :id => "539fd88c101897f7cd000008",
        :object => "eviction",
        :uri => "/v1/evictions/539fd88c101897f7cd000008",
        :status => "consider",
        :created_at => "2014-01-18T12:34:00Z",
        :completed_at => "2014-01-18T12:35:30Z",
        :turnaround_time => 90,
        :records =>
        [{
          :case_number => "24323-DA",
          :file_date => "2013-10-08",
          :court_jurisdiction => "San Francisco",
          :full_name => "John Alfred Smith",
          :judgement_amount => 1500,
          :plaintiff => "Roger Peterson",
          :offense => "Non payment",
          :address => {
            :street => "123 S Folsom St",
            :unit => nil,
            :city => "San Francisco",
            :state => "CA",
            :zipcode => "94110"
          }
        }]}
    end

    def test_document
      {:id=>"4722c07dd9a10c3985ae432a",
       :object=>"document",
       :created_at=>"2015-02-11T20:01:50Z",
       :download_uri=>"https://checkr-documents.checkr.com/download_path",
       :filesize=>8576,
       :filename=>"1423684910_candidate_driver_license.jpg",
       :content_type=>"image/jpeg"}
    end
    def test_document_list
      {
        :object => 'list',
        :data => [test_document, test_document, test_document],
      }
    end

    # Errors
    def test_api_error
      {
        :error => {
          :type => "api_error"
        }
      }
    end

    def test_invalid_api_key_error
      {
        :error => {
          :type => "invalid_request_error",
          :message => "Invalid API Key provided: invalid"
        }
      }
    end

    def test_missing_id_error
      {
        :error => {
          :param => "id",
          :type => "invalid_request_error",
          :message => "Missing id"
        }
      }
    end

  end
end

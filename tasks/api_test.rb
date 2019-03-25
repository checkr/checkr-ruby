require 'checkr'

class APITest
  def initialize(api_key: nil, bearer_token: nil)
    Checkr.api_key = api_key
    Checkr.bearer_token = bearer_token
  end

  def run
    geos = run_geos_test
    candidate = run_candidate_tests(geos)
    document = run_document_tests(candidate)
    consider, clear = run_report_tests(candidate)
    run_ssn_trace_tests(consider, clear)
    run_sex_offender_search_tests(consider, clear)
    # TODO: Uncomment this when there isn't a forbidden bug with shared resources in test.
    # run_global_watchlist_search_tests(consider, clear)
    run_national_criminal_search_tests(consider, clear)
    run_county_criminal_search_tests(consider, clear)
    run_motor_vehicle_report_tests(consider, clear)
  end

  def run_geos_test
    puts "Looking up geos..."
    geos = Checkr::Geo.all
    puts "Found #{geos.length} geos."

    scrantons = geos.select{ |g| g.name == "Scranton" }
    puts "Found #{scrantons.size} scrantons"

    if scrantons.empty?
      scrantons << Checkr::Geo.create({
        :name => "Scranton",
        :state => "PA"
      })
    end

    puts "Deleting the geo for Scranton"
    scrantons.each(&:delete)

    puts "Create the Scranton geo..."
    scranton = Checkr::Geo.create({
      :name => "Scranton",
      :state => "PA"
    })
    puts "Created: #{scranton.inspect}"

    puts "Looking up a created geo."
    geo = Checkr::Geo.retrieve(scranton.id)
    puts "Found: #{geo.inspect}"

    Checkr::Geo.all.select{ |g| g.state == "CA" }
  end

  def run_candidate_tests(geos)
    puts "Creating a candidate..."
    candidate = Checkr::Candidate.create({
      :first_name => "John",
      :middle_name => "Alfred",
      :last_name => "Smith",
      :email => "John.Smith@gmail.com",
      :phone => "5555555555",
      :zipcode => "90401",
      :dob => "1970-01-22",
      :ssn => "543-43-4645",
      :driver_license_number => "F2111651",
      :driver_license_state => "CA",
      :geo_ids => geos.map(&:id)
    })
    puts "Created: #{candidate.inspect}"

    puts "Looking up all candidates..."
    candidates = Checkr::Candidate.all
    puts "Found #{candidates.length} candidates."

    puts "Retrieving the created candidate..."
    candidate = Checkr::Candidate.retrieve(candidate.id)
    puts "Retrieved the candidate with id=#{candidate.id}"

    candidate
  end

  def run_document_tests(candidate)
    puts "Creating a document..."
    document = candidate.documents.create({
      :type => "driver_license",
      :file => File.open("#{File.dirname(__FILE__)}/../mclovin.jpg")
    })
    puts "Created: #{document.inspect}"

    puts "Looking up all documents..."
    documents = candidate.documents.all
    puts "Found #{documents.length} documents."

    document
  end

  def run_report_tests(candidate)
    puts "Creating a report for Candidate##{candidate.id}..."
    report = candidate.reports.create("tasker_standard")
    puts "Created #{report.inspect}"

    puts "Retrieving the created report..."
    report = Checkr::Report.retrieve(report.id)
    puts "Retrieved the report with id=#{report.id}"

    puts "Updating the report..."
    report.package = "driver_standard"
    report.save
    puts "New package is #{report.package}"

    puts "Retrieving a consider report..."
    consider = Checkr::Report.retrieve("59b650f567e1dd0f01422b92")
    puts "Retrieving a clear report..."
    clear = Checkr::Report.retrieve("31e894fc23e30953c26a2d26")

    [consider, clear]
  end

  def run_ssn_trace_tests(consider, clear)
    puts "Retrieving SSN Trace using the consider report."
    consider.ssn_trace.refresh
    puts "Retrieved the SSN Trace: #{consider.ssn_trace.inspect}"

    puts "Retrieving SSN Trace using the clear report."
    ssn_trace = Checkr::SSNTrace.retrieve(clear.ssn_trace.id)
    puts "Retrieved the SSN Trace: #{ssn_trace.inspect}"

    ssn_trace
  end

  def run_sex_offender_search_tests(consider, clear)
    puts "Retrieving Sex Offender Search using the consider report."
    consider.sex_offender_search.refresh
    puts "Retrieved the Sex Offender Search: #{consider.sex_offender_search.inspect}"

    puts "Retrieving Sex Offender Search using the clear report."
    sex_offender_search = Checkr::SexOffenderSearch.retrieve(clear.sex_offender_search.id)
    puts "Retrieved the Sex Offender Search: #{sex_offender_search.inspect}"

    sex_offender_search
  end

  def run_global_watchlist_search_tests(consider, clear)
    puts "Retrieving using consider..."
    consider.global_watchlist_search.refresh
    puts "Retrieved the global_watchlist_search: #{consider.global_watchlist_search.inspect}"

    puts "Retrieving using clear report..."
    global_watchlist_search = Checkr::GlobalWatchlistSearch.retrieve(clear.global_watchlist_search.id)
    puts "Retrieved the global_watchlist_search: #{global_watchlist_search.inspect}"

    global_watchlist_search
  end

  def run_national_criminal_search_tests(consider, clear)
    puts "Retrieving using consider..."
    consider.national_criminal_search.refresh
    puts "Retrieved the national_criminal_search: #{consider.national_criminal_search.inspect}"

    puts "Retrieving using clear report..."
    national_criminal_search = Checkr::NationalCriminalSearch.retrieve(clear.national_criminal_search.id)
    puts "Retrieved the national_criminal_search: #{national_criminal_search.inspect}"

    national_criminal_search
  end

  def run_county_criminal_search_tests(consider, clear)
    puts "Retrieving using consider..."
    consider.county_criminal_searches.first.refresh
    puts "Retrieved the county_criminal_search: #{consider.county_criminal_searches.first.inspect}"

    puts "Retrieving using clear report..."
    county_criminal_search = Checkr::CountyCriminalSearch.retrieve(clear.county_criminal_searches.first.id)
    puts "Retrieved the county_criminal_search: #{county_criminal_search.inspect}"

    county_criminal_search
  end

  def run_motor_vehicle_report_tests(consider, clear)
    puts "Retrieving using consider..."
    consider.motor_vehicle_report.refresh
    puts "Retrieved the motor_vehicle_report: #{consider.motor_vehicle_report.inspect}"

    puts "Retrieving using clear report..."
    motor_vehicle_report = Checkr::MotorVehicleReport.retrieve(clear.motor_vehicle_report.id)
    puts "Retrieved the motor_vehicle_report: #{motor_vehicle_report.inspect}"

    motor_vehicle_report
  end
end

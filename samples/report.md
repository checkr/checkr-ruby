# Report

## The Report Object

### Example Response

```ruby
#<Checkr::Report:0x3fd909f15938 id=4722c07dd9a10c3985ae432a> JSON: {
  "status": "pending",
  "values": null,
  "completed_at": null,
  "turnaround_time": null,
  "package": "driver_plus",
  "candidate": {"documents":{"object":"list","data":[]},"id":"e44aa283528e6fde7d542194"},
  "ssn_trace": {"id":"53ab44eb0189e72f1500003b"},
  "sex_offender_search": {"id":"53ab44eb0189e72f15000046"},
  "national_criminal_search": {"id":"53ab44eb0189e72f15000044"},
  "terrorist_watchlist_search": {"id":"54aa27ef3662630006000000"},
  "county_criminal_searches": {"object":"list","data":[{"id":"539fdcf335644a0ef4000001"},{"id":"54aa27f1316231009c000000"},{"id":"5508ba3b66366305a2000000"}]},
  "motor_vehicle_report": {"id":"53ab44eb0189e72f15000045"},
  "id": "4722c07dd9a10c3985ae432a",
  "object": "test_report",
  "uri": "/v1/reports/4722c07dd9a10c3985ae432a",
  "created_at": "2014-06-17T05:56:28Z"
}
```



## Create a new Report

### Definition

```ruby
Checkr::Report.create
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

candidate = Checkr::Candidate.retrieve("e44aa283528e6fde7d542194")
report = Checkr::Report.create({
  :package => "driver_plus",
  :candidate_id => candidate.id
})
```

### Example Response

```ruby
#<Checkr::Report:0x3fd909d5cee8 id=3fe1e58b1697d6fed2c65c0e> JSON: {
  "status": "pending",
  "values": null,
  "completed_at": null,
  "turnaround_time": null,
  "package": "driver_plus",
  "candidate": {"documents":{"object":"list","data":[]},"id":"e44aa283528e6fde7d542194"},
  "ssn_trace": {"id":"5511cdbf613766000b840400"},
  "sex_offender_search": {"id":"5511cdbf613766000b8d0400"},
  "national_criminal_search": {"id":"5511cdbf613766000b8b0400"},
  "terrorist_watchlist_search": {"id":"5511cdbf613766000b8e0400"},
  "global_watchlist_search": {"id":"5511cdbf613766000b8e0400"},
  "county_criminal_searches": {"object":"list","data":[]},
  "motor_vehicle_report": {"id":"5511cdbf613766000b8c0400"},
  "id": "3fe1e58b1697d6fed2c65c0e",
  "object": "test_report",
  "uri": "/v1/reports/3fe1e58b1697d6fed2c65c0e",
  "created_at": "2015-03-24T20:49:03Z"
}
```



## Retrieve an existing Report

### Definition

```ruby
Checkr::Report.retrieve({REPORT_ID})
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

report = Checkr::Report.retrieve("4722c07dd9a10c3985ae432a")
```

### Example Response

```ruby
#<Checkr::Report:0x3fd909a57edc id=4722c07dd9a10c3985ae432a> JSON: {
  "status": "pending",
  "values": null,
  "completed_at": null,
  "turnaround_time": null,
  "package": "driver_plus",
  "candidate": {"documents":{"object":"list","data":[]},"id":"e44aa283528e6fde7d542194"},
  "ssn_trace": {"id":"53ab44eb0189e72f1500003b"},
  "sex_offender_search": {"id":"53ab44eb0189e72f15000046"},
  "national_criminal_search": {"id":"53ab44eb0189e72f15000044"},
  "terrorist_watchlist_search": {"id":"54aa27ef3662630006000000"},
  "global_watchlist_search": {"id":"54aa27ef3662630006000000"},
  "county_criminal_searches": {"object":"list","data":[{"id":"539fdcf335644a0ef4000001"},{"id":"54aa27f1316231009c000000"},{"id":"5508ba3b66366305a2000000"}]},
  "motor_vehicle_report": {"id":"53ab44eb0189e72f15000045"},
  "id": "4722c07dd9a10c3985ae432a",
  "object": "test_report",
  "uri": "/v1/reports/4722c07dd9a10c3985ae432a",
  "created_at": "2014-06-17T05:56:28Z"
}
```

## Update an existing Report

### Definition

```ruby
report = Checkr::Report.retrieve({REPORT_ID})
report.package = {NEW_PACKAGE}
report.save
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

report = Checkr::Report.retrieve("4722c07dd9a10c3985ae432a")
report.package = "driver_plus"
report.save
```

### Example Response

```ruby
#<Checkr::Report:0x3fd909d21cf8 id=4722c07dd9a10c3985ae432a> JSON: {
  "status": "pending",
  "adjudication": null,
  "values": null,
  "completed_at": null,
  "turnaround_time": null,
  "package": "driver_plus",
  "candidate": {"documents":{"object":"list","data":[]},"id":"e44aa283528e6fde7d542194"},
  "ssn_trace": {"id":"53ab44eb0189e72f1500003b"},
  "sex_offender_search": {"id":"53ab44eb0189e72f15000046"},
  "national_criminal_search": {"id":"53ab44eb0189e72f15000044"},
  "terrorist_watchlist_search": {"id":"54aa27ef3662630006000000"},
  "global_watchlist_search": {"id":"54aa27ef3662630006000000"},
  "county_criminal_searches": {"object":"list","data":[{"id":"539fdcf335644a0ef4000001"},{"id":"54aa27f1316231009c000000"},{"id":"5508ba3b66366305a2000000"}]},
  "motor_vehicle_report": {"id":"53ab44eb0189e72f15000045"},
  "id": "4722c07dd9a10c3985ae432a",
  "object": "test_report",
  "uri": "/v1/reports/4722c07dd9a10c3985ae432a",
  "created_at": "2014-06-17T05:56:28Z"
}
```

# Motor Vehicle Report

## The Motor Vehicle Report Object

### Example Response

```ruby
#<Checkr::MotorVehicleReport:0x3fd90c0e05f4 id=539fd88c101897f7cd000007> JSON: {
  "status": "consider",
  "completed_at": "2014-01-18T12:35:30Z",
  "turnaround_time": 90,
  "full_name": "John Alfred Smith",
  "license_number": "F2111132",
  "license_state": "CA",
  "previous_license_number": null,
  "previous_license_state": null,
  "license_status": "valid",
  "license_type": "non-commercial",
  "license_class": "C",
  "expiration_date": "2016-07-24",
  "issued_date": "2006-12-03",
  "first_issued_date": "2000-01-14",
  "inferred_issued_date": null,
  "restrictions": null,
  "accidents": [
    {
      "accident_date": "2009-04-12",
      "description": "property damage",
      "city": null,
      "county": "SAN FRANCISCO",
      "state": null,
      "order_number": "33-435932",
      "points": null,
      "vehicle_speed": null,
      "reinstatement_date": null,
      "action_taken": "police report filed",
      "ticket_number": null,
      "enforcing_agency": "San Francisco PD",
      "jurisdiction": null,
      "severity": null,
      "violation_number": null,
      "license_plate": "6UM6938",
      "fine_amount": null,
      "acd_code": null,
      "state_code": null,
      "additional_info": null,
      "injury_accident": false,
      "fatality_accident": false,
      "fatality_count": 0,
      "injury_count": 0,
      "vehicles_involved_count": 1,
      "report_number": null,
      "policy_number": null
    }
  ],
  "violations": [
    {
      "type": "conviction",
      "issued_date": "2011-11-14",
      "conviction_date": "2010-04-11",
      "description": "speeding 15-19 mph",
      "points": 0,
      "city": null,
      "county": "SANTA CLARA",
      "state": "California",
      "ticket_number": "2D55555",
      "disposition": null,
      "category": null,
      "avd_category_id": null,
      "court_name": null,
      "acd_code": null,
      "state_code": null,
      "docket": null,
      "additional_info": null
    }
  ],
  "id": "539fd88c101897f7cd000007",
  "object": "motor_vehicle_report",
  "uri": "/v1/motor_vehicle_reports/539fd88c101897f7cd000007",
  "created_at": "2014-01-18T12:34:00Z"
}
```



## Retrieve an existing Motor Vehicle Report

### Definition

```ruby
Checkr::MotorVehicleReport.retrieve({MOTOR_VEHICLE_REPORT_ID})
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

mvr = Checkr::MotorVehicleReport.retrieve("539fd88c101897f7cd000007")
```

### Example Response

```ruby
#<Checkr::MotorVehicleReport:0x3fd909bd7550 id=539fd88c101897f7cd000007> JSON: {
  "status": "pending",
  "completed_at": null,
  "turnaround_time": null,
  "full_name": "",
  "license_number": null,
  "license_state": null,
  "previous_license_number": null,
  "previous_license_state": null,
  "license_status": null,
  "license_type": null,
  "license_class": null,
  "expiration_date": null,
  "issued_date": null,
  "first_issued_date": null,
  "inferred_issued_date": null,
  "restrictions": [

  ],
  "accidents": [

  ],
  "violations": [

  ],
  "id": "539fd88c101897f7cd000007",
  "object": "test_motor_vehicle_report",
  "uri": "/v1/motor_vehicle_reports/539fd88c101897f7cd000007",
  "created_at": "2014-06-17T05:56:28Z"
}
```

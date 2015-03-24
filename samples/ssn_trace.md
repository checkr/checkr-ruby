# SSN Trace

## The SSN Trace Object

### Example Response

```ruby
#<Checkr::SSNTrace:0x3fd90a1ae654 id=539fd88c101897f7cd000001> JSON: {
  "status": "pending",
  "completed_at": null,
  "turnaround_time": null,
  "ssn": "XXX-XX-4645",
  "addresses": [
    {
      "street": "92074 Kuvalis Alley",
      "unit": "Apt. 419",
      "city": "East Greysonview",
      "state": "ID",
      "zipcode": "91989-2898",
      "county": "County Down",
      "from_date": null,
      "to_date": null
    },
    {
      "street": "4527 Forest Flat",
      "unit": "Apt. 390",
      "city": "North Huntermouth",
      "state": "FL",
      "zipcode": "28804",
      "county": "Shropshire",
      "from_date": null,
      "to_date": null
    },
    {
      "street": "47674 Stroman Light",
      "unit": "Suite 893",
      "city": "Goyetteton",
      "state": "MI",
      "zipcode": "50845",
      "county": "Lancashire",
      "from_date": null,
      "to_date": null
    },
    {
      "street": "812 Kemmer Run",
      "unit": "Apt. 590",
      "city": "Crawfordview",
      "state": "WI",
      "zipcode": "08754",
      "county": "West Midlands",
      "from_date": null,
      "to_date": null
    }
  ],
  "id": "539fd88c101897f7cd000001",
  "object": "test_ssn_trace",
  "uri": "/v1/ssn_traces/539fd88c101897f7cd000001",
  "created_at": "2014-06-17T05:56:28Z"
}
```



## Retrieve an existing SSN Trace

### Definition

```ruby
Checkr::SSNTrace.retrieve({SSN_TRADE_ID})
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

ssn_trace = Checkr::SSNTrace.retrieve("539fd88c101897f7cd000001")
```

### Example Response

```ruby
#<Checkr::SSNTrace:0x3fd90a1ae654 id=539fd88c101897f7cd000001> JSON: {
  "status": "pending",
  "completed_at": null,
  "turnaround_time": null,
  "ssn": "XXX-XX-4645",
  "addresses": [
    {
      "street": "92074 Kuvalis Alley",
      "unit": "Apt. 419",
      "city": "East Greysonview",
      "state": "ID",
      "zipcode": "91989-2898",
      "county": "County Down",
      "from_date": null,
      "to_date": null
    },
    {
      "street": "4527 Forest Flat",
      "unit": "Apt. 390",
      "city": "North Huntermouth",
      "state": "FL",
      "zipcode": "28804",
      "county": "Shropshire",
      "from_date": null,
      "to_date": null
    },
    {
      "street": "47674 Stroman Light",
      "unit": "Suite 893",
      "city": "Goyetteton",
      "state": "MI",
      "zipcode": "50845",
      "county": "Lancashire",
      "from_date": null,
      "to_date": null
    },
    {
      "street": "812 Kemmer Run",
      "unit": "Apt. 590",
      "city": "Crawfordview",
      "state": "WI",
      "zipcode": "08754",
      "county": "West Midlands",
      "from_date": null,
      "to_date": null
    }
  ],
  "id": "539fd88c101897f7cd000001",
  "object": "test_ssn_trace",
  "uri": "/v1/ssn_traces/539fd88c101897f7cd000001",
  "created_at": "2014-06-17T05:56:28Z"
}
```

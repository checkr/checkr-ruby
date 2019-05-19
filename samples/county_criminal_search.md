# County Criminal Search

## The County Criminal Search Object

### Example Response

```ruby
#<Checkr::CountyCriminalSearch:0x3fd909bcd974 id=539fdcf335644a0ef4000001> JSON: {
  "status": "pending",
  "completed_at": null,
  "turnaround_time": null,
  "county": "San Francisco",
  "state": "CA",
  "records": [

  ],
  "id": "539fdcf335644a0ef4000001",
  "object": "test_county_criminal_search",
  "uri": "/v1/county_criminal_searches/539fdcf335644a0ef4000001",
  "created_at": "2014-06-17T06:15:47Z"
}
```



## Retrieve an existing County Criminal Search

### Definition

```ruby
Checkr::CountyCriminalSearch.retrieve({COUNTY_CRIMINAL_SEARCH_ID})
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

ccs = Checkr::CountyCriminalSearch.retrieve("539fdcf335644a0ef4000001")
```

### Example Response

```ruby
#<Checkr::CountyCriminalSearch:0x3fd909bcd974 id=539fdcf335644a0ef4000001> JSON: {
  "status": "pending",
  "completed_at": null,
  "turnaround_time": null,
  "county": "San Francisco",
  "state": "CA",
  "records": [

  ],
  "id": "539fdcf335644a0ef4000001",
  "object": "test_county_criminal_search",
  "uri": "/v1/county_criminal_searches/539fdcf335644a0ef4000001",
  "created_at": "2014-06-17T06:15:47Z"
}
```

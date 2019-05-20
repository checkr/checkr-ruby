# State Criminal Search

## The State Criminal Search Object

### Example Response

```ruby
#<Checkr::StateCriminalSearch:0x3fd909bcd974 id=539fdcf335644a0ef4000001> JSON: {
  "status": "pending",
  "completed_at": "2019-05-14T19:43:32Z",
  "turnaround_time": 455685,
  "state": "CA",
  "records": [],
  "id": "539fdcf335644a0ef4000001",
  "object": "test_state_criminal_search",
  "uri": "/v1/state_criminal_searches/539fdcf335644a0ef4000001",
  "created_at": "2014-06-17T06:15:47Z",
  "estimated_completion_time": "2019-05-09T21:40:45Z",
  "estimated_completion_date": "2019-05-10",
  "filtered_by_positive_adjudication_records": []
}
```


## Retrieve an existing State Criminal Search

### Definition

```ruby
Checkr::StateCriminalSearch.retrieve({STATE_CRIMINAL_SEARCH_ID})
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

ccs = Checkr::StateCriminalSearch.retrieve("539fdcf335644a0ef4000001")
```

### Example Response

```ruby
#<Checkr::StateCriminalSearch:0x3fd909bcd974 id=539fdcf335644a0ef4000001> JSON: {
  "status": "pending",
  "completed_at": "2019-05-14T19:43:32Z",
  "turnaround_time": 455685,
  "state": "CA",
  "records": [],
  "id": "539fdcf335644a0ef4000001",
  "object": "test_state_criminal_search",
  "uri": "/v1/state_criminal_searches/539fdcf335644a0ef4000001",
  "created_at": "2014-06-17T06:15:47Z",
  "estimated_completion_time": "2019-05-09T21:40:45Z",
  "estimated_completion_date": "2019-05-10",
  "filtered_by_positive_adjudication_records": []
}
```

# National Criminal Search

## The National Criminal Search Object

### Example Response

```ruby
#<Checkr::NationalCriminalSearch:0x3fd909bad78c id=539fd88c101897f7cd000006> JSON: {
  "status": "pending",
  "completed_at": null,
  "turnaround_time": null,
  "records": [

  ],
  "id": "539fd88c101897f7cd000006",
  "object": "test_national_criminal_search",
  "uri": "/v1/national_criminal_searches/539fd88c101897f7cd000006",
  "created_at": "2014-06-17T05:56:28Z"
}
```



## Retrieve an existing National Criminal Search

### Definition

```ruby
Checkr::NationalCriminalSearch.retrieve({NATIONAL_CRIMINAL_SEARCH_ID})
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

ncs = Checkr::NationalCriminalSearch.retrieve("539fd88c101897f7cd000006")
```

### Example Response

```ruby
#<Checkr::NationalCriminalSearch:0x3fd909bad78c id=539fd88c101897f7cd000006> JSON: {
  "status": "pending",
  "completed_at": null,
  "turnaround_time": null,
  "records": [

  ],
  "id": "539fd88c101897f7cd000006",
  "object": "test_national_criminal_search",
  "uri": "/v1/national_criminal_searches/539fd88c101897f7cd000006",
  "created_at": "2014-06-17T05:56:28Z"
}
```

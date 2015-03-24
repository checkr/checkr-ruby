# Sex Offender Search

## The Sex Offender Search Object

### Example Response

```ruby
#<Checkr::SexOffenderSearch:0x3fd909b50028 id=539fd88c101897f7cd000008> JSON: {
  "status": "pending",
  "values": null,
  "completed_at": null,
  "turnaround_time": null,
  "records": [

  ],
  "id": "539fd88c101897f7cd000008",
  "object": "test_sex_offender_search",
  "uri": "/v1/sex_offender_searches/539fd88c101897f7cd000008",
  "created_at": "2014-06-17T05:56:28Z"
}
```



## Retrieve an existing Sex Offender Search

### Definition

```ruby
Checkr::SexOffenderSearch.retrieve({SEX_OFFENDER_SEARCH_ID})
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

sex_offender_search = Checkr::SexOffenderSearch.retrieve("539fd88c101897f7cd000008")
```

### Example Response

```ruby
#<Checkr::SexOffenderSearch:0x3fd909b50028 id=539fd88c101897f7cd000008> JSON: {
  "status": "pending",
  "values": null,
  "completed_at": null,
  "turnaround_time": null,
  "records": [

  ],
  "id": "539fd88c101897f7cd000008",
  "object": "test_sex_offender_search",
  "uri": "/v1/sex_offender_searches/539fd88c101897f7cd000008",
  "created_at": "2014-06-17T05:56:28Z"
}
```

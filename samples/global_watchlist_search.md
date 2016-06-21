# Global Watchlist Search

## The Global Watchlist Search Object

### Example Response

```ruby
#<Checkr::GlobalWatchlistSearch:0x3fd909b9dc24 id=539fd88c101897f7cd000008> JSON: {
  "status": "consider",
  "completed_at": "2014-01-18T12:35:30Z",
  "turnaround_time": 90,
  "records": [
    {
      "case_number": "24323-DA",
      "file_date": null,
      "arresting_agency": "DEA Boston Division",
      "court_jurisdiction": null,
      "court_of_record": null,
      "dob": "1970-01-22",
      "full_name": "John Alfred Smith",
      "charges": [
        {
          "charge": "RICO murder",
          "charge_type": null,
          "charge_id": null,
          "classification": "Felony",
          "deposition": null,
          "defendant": null,
          "plaintiff": null,
          "sentence": "Active Punishment Minimum: 10Y",
          "disposition": "Guilty",
          "probation_status": null,
          "offense_date": "2011-04-22",
          "deposition_date": "2014-05-27",
          "arrest_date": null,
          "charge_date": null,
          "sentence_date": null,
          "disposition_date": "2011-06-02"
        }
      ]
    }
  ],
  "id": "539fd88c101897f7cd000008",
  "object": "global_watchlist_search",
  "uri": "/v1/global_watchlist_searches/539fd88c101897f7cd000008",
  "created_at": "2014-01-18T12:34:00Z"
}
```



## Retrieve an existing Global Watchlist Search

### Definition

```ruby
Checkr::GlobalWatchlistSearch.retrieve({TERRORIST_WATCHLIST_SEARCH_ID})
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

tws = Checkr::GlobalWatchlistSearch.retrieve("539fd88c101897f7cd000008")
```

### Example Response

```ruby
#<Checkr::GlobalWatchlistSearch:0x3fd909b9dc24 id=539fd88c101897f7cd000008> JSON: {
  "status": "consider",
  "completed_at": "2014-01-18T12:35:30Z",
  "turnaround_time": 90,
  "records": [
    {
      "case_number": "24323-DA",
      "file_date": null,
      "arresting_agency": "DEA Boston Division",
      "court_jurisdiction": null,
      "court_of_record": null,
      "dob": "1970-01-22",
      "full_name": "John Alfred Smith",
      "charges": [
        {
          "charge": "RICO murder",
          "charge_type": null,
          "charge_id": null,
          "classification": "Felony",
          "deposition": null,
          "defendant": null,
          "plaintiff": null,
          "sentence": "Active Punishment Minimum: 10Y",
          "disposition": "Guilty",
          "probation_status": null,
          "offense_date": "2011-04-22",
          "deposition_date": "2014-05-27",
          "arrest_date": null,
          "charge_date": null,
          "sentence_date": null,
          "disposition_date": "2011-06-02"
        }
      ]
    }
  ],
  "id": "539fd88c101897f7cd000008",
  "object": "global_watchlist_search",
  "uri": "/v1/global_watchlist_searches/539fd88c101897f7cd000008",
  "created_at": "2014-01-18T12:34:00Z"
}
```

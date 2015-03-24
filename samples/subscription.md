# Subscription

## The Subscription Object

### Example Response

```ruby
#<Checkr::Subscription:0x3fd909a8a1ac id=ef7972ff5ea65dcb47214143> JSON: {
  "status": "active",
  "values": null,
  "canceled_at": null,
  "package": "driver_plus",
  "interval_count": 1,
  "interval_unit": "month",
  "start_date": "2017-02-10",
  "candidate": {"documents":{"object":"list","data":[]},"id":"e44aa283528e6fde7d542194"},
  "id": "ef7972ff5ea65dcb47214143",
  "object": "test_subscription",
  "uri": "/v1/subscriptions/ef7972ff5ea65dcb47214143",
  "created_at": "2015-03-24T20:55:30Z"
}
```



## Create a new Subscription

### Definition

```ruby
Checkr::Subscription.create
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

candidate = Checkr::Candidate.retrieve("e44aa283528e6fde7d542194")
subscription = Checkr::Subscription.create({
  :package => "driver_plus",
  :start_date => "2017-02-10",
  :interval_unit => "month",
  :interval_count => 1,
  :candidate_id => candidate.id
})
```

### Example Response

```ruby
#<Checkr::Subscription:0x3fd909a8a1ac id=ef7972ff5ea65dcb47214143> JSON: {
  "status": "active",
  "values": null,
  "canceled_at": null,
  "package": "driver_plus",
  "interval_count": 1,
  "interval_unit": "month",
  "start_date": "2017-02-10",
  "candidate": {"documents":{"object":"list","data":[]},"id":"e44aa283528e6fde7d542194"},
  "id": "ef7972ff5ea65dcb47214143",
  "object": "test_subscription",
  "uri": "/v1/subscriptions/ef7972ff5ea65dcb47214143",
  "created_at": "2015-03-24T20:55:30Z"
}
```



## Retrieve an existing Subscription

### Definition

```ruby
Checkr::Subscription.retrieve({SUBSCRIPTION_ID})
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

subscription = Checkr::Subscription.retrieve("ef7972ff5ea65dcb47214143")
```

### Example Response

```ruby
#<Checkr::Subscription:0x3fd90a1309ac id=ef7972ff5ea65dcb47214143> JSON: {
  "status": "active",
  "values": null,
  "canceled_at": null,
  "package": "driver_plus",
  "interval_count": 1,
  "interval_unit": "month",
  "start_date": "2017-02-10",
  "candidate": {"documents":{"object":"list","data":[]},"id":"e44aa283528e6fde7d542194"},
  "id": "ef7972ff5ea65dcb47214143",
  "object": "test_subscription",
  "uri": "/v1/subscriptions/ef7972ff5ea65dcb47214143",
  "created_at": "2015-03-24T20:55:30Z"
}
```

## Cancel an existing Subscription

### Definition

```ruby
subscription = Checkr::Subscription.retrieve({SUBSCRIPTION_ID})
subscription.cancel
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

subscription = Checkr::Subscription.retrieve("ef7972ff5ea65dcb47214143")
subscription.cancel
```

### Example Response

```ruby
#<Checkr::Subscription:0x3fd909a9c370 id=ef7972ff5ea65dcb47214143> JSON: {
  "status": "inactive",
  "values": null,
  "canceled_at": "2015-03-24T20:57:43Z",
  "package": "driver_plus",
  "interval_count": 1,
  "interval_unit": "month",
  "start_date": "2017-02-10",
  "candidate": {"documents":{"object":"list","data":[]},"id":"e44aa283528e6fde7d542194"},
  "id": "ef7972ff5ea65dcb47214143",
  "object": "test_subscription",
  "uri": "/v1/subscriptions/ef7972ff5ea65dcb47214143",
  "created_at": "2015-03-24T20:55:30Z"
}
```

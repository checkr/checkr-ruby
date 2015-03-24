# Geo

## The Geo Object

### Example Response

```ruby

```



## Create a new Geo

### Definition

```ruby
Checkr::Geo.create
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

geo = Checkr::Geo.create({
  :name => "San Francisco",
  :state => "CA"
})
```

### Example Response

```ruby
#<Checkr::Geo:0x3fd90aafbb58 id=5647cff4050585829088f3d7> JSON: {
  "name": "San Francisco",
  "state": "CA",
  "id": "5647cff4050585829088f3d7",
  "object": "geo",
  "uri": "/v1/geos/5647cff4050585829088f3d7",
  "created_at": "2015-03-24T21:03:30Z"
}
```



## Retrieve an existing Geo

### Definition

```ruby
Checkr::Geo.retrieve({GEO_ID})
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

geo = Checkr::Geo.retrieve("5647cff4050585829088f3d7")
```

### Example Response

```ruby
#<Checkr::Geo:0x3fd909ae0610 id=5647cff4050585829088f3d7> JSON: {
  "name": "San Francisco",
  "state": "CA",
  "id": "5647cff4050585829088f3d7",
  "object": "geo",
  "uri": "/v1/geos/5647cff4050585829088f3d7",
  "created_at": "2015-03-24T21:03:30Z"
}
```




## Delete an existing Geo

### Definition

```ruby
geo = Checkr::Geo.retrieve({GEO_ID})
geo.delete
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

geo = Checkr::Geo.retrieve("5647cff4050585829088f3d7")
geo.delete
```

### Example Response

```ruby
#<Checkr::Geo:0x3fd90c139dd4 id=5647cff4050585829088f3d7> JSON: {
  "name": "San Francisco",
  "state": "CA",
  "id": "5647cff4050585829088f3d7",
  "object": "geo",
  "uri": "/v1/geos/5647cff4050585829088f3d7",
  "created_at": "2015-03-24T21:03:30Z"
}
```




## List existing Geos

### Definition

```ruby
Checkr::Geo.all
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

geos = Checkr::Geo.all
```

### Example Response

```ruby
#<Checkr::APIList:0x3fd90c175b54> JSON: {
  "object": "list",
  "data": [
    #<Checkr::Geo:0x3fd90c17567c id=87f5bb4983eade22c55f4731> JSON: {
	  "name": "San Francisco",
	  "state": "CA",
	  "id": "87f5bb4983eade22c55f4731",
	  "object": "geo",
	  "uri": "/v1/geos/87f5bb4983eade22c55f4731",
	  "created_at": "2015-03-24T21:05:48Z"
	},
	...
  ]
}
```

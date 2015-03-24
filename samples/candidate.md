# Candidate

## The Candidate Object

### Example Response

```ruby
#<Checkr::Candidate:0x3fd909a22584 id=e44aa283528e6fde7d542194> JSON: {
  "first_name": "John",
  "middle_name": "Alfred",
  "last_name": "Smith",
  "email": "john.smith@gmail.com",
  "phone": null,
  "zipcode": "90401",
  "dob": "1970-01-22",
  "ssn": "XXX-XX-4645",
  "driver_license_number": "F211165",
  "driver_license_state": "CA",
  "previous_driver_license_number": null,
  "previous_driver_license_state": null,
  "copy_requested": false,
  "custom_id": null,
  "reports": {"object":"list","data":[{"id":"4722c07dd9a10c3985ae432a"}, ...]},
  "geos": {"object":"list","data":[]},
  "adjudication": null,
  "documents": {"object":"list","data":[]},
  "id": "e44aa283528e6fde7d542194",
  "object": "test_candidate",
  "uri": "/v1/candidates/e44aa283528e6fde7d542194",
  "created_at": "2014-06-17T05:55:47Z"
}
```



## Create a new Candidate

### Definition

```ruby
Checkr::Candidate.create
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

candidate = Checkr::Candidate.create({
  :first_name => "John",
  :middle_name => "Alfred",
  :last_name => "Smith",
  :email => "john.smith@gmail.com",
  :phone => "5555555555",
  :zipcode => "90401",
  :dob => "1970-01-22",
  :ssn => "543-43-4645",
  :driver_license_number => "F211165",
  :driver_license_state => "CA"
})
```

### Example Response

```ruby
#<Checkr::Candidate:0x3fd909a14cb8 id=25a317218b8c3254cec8ccfb> JSON: {
  "first_name": "John",
  "middle_name": "Alfred",
  "last_name": "Smith",
  "email": "john.smith@gmail.com",
  "phone": "5555555555",
  "zipcode": "90401",
  "dob": "1970-01-22",
  "ssn": "XXX-XX-4645",
  "driver_license_number": "F211165",
  "driver_license_state": "CA",
  "previous_driver_license_number": null,
  "previous_driver_license_state": null,
  "copy_requested": false,
  "custom_id": null,
  "reports": {"object":"list","data":[]},
  "geos": {"object":"list","data":[]},
  "adjudication": null,
  "documents": {"object":"list","data":[]},
  "id": "25a317218b8c3254cec8ccfb",
  "object": "test_candidate",
  "uri": "/v1/candidates/25a317218b8c3254cec8ccfb",
  "created_at": "2015-03-24T20:44:26Z"
}
```



## Retrieve an existing Candidate

### Definition

```ruby
Checkr::Candidate.retrieve({CANDIDATE_ID})
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

candidate = Checkr::Candidate.retrieve("e44aa283528e6fde7d542194")
```

### Example Response

```ruby
#<Checkr::Candidate:0x3fd909a22584 id=e44aa283528e6fde7d542194> JSON: {
  "first_name": "John",
  "middle_name": "Alfred",
  "last_name": "Smith",
  "email": "john.smith@gmail.com",
  "phone": null,
  "zipcode": "90401",
  "dob": "1970-01-22",
  "ssn": "XXX-XX-4645",
  "driver_license_number": "F211165",
  "driver_license_state": "CA",
  "previous_driver_license_number": null,
  "previous_driver_license_state": null,
  "copy_requested": false,
  "custom_id": null,
  "reports": {"object":"list","data":[{"id":"4722c07dd9a10c3985ae432a"}, ...]},
  "geos": {"object":"list","data":[]},
  "adjudication": null,
  "documents": {"object":"list","data":[]},
  "id": "e44aa283528e6fde7d542194",
  "object": "test_candidate",
  "uri": "/v1/candidates/e44aa283528e6fde7d542194",
  "created_at": "2014-06-17T05:55:47Z"
}
```


## List existing Candidates

### Definition

```ruby
Checkr::Candidate.all
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

candidates = Checkr::Candidate.all({
  :created_after => "2015-03-23"
})
```

### Example Response

```ruby
#<Checkr::APIList:0x3ffc490506b0> JSON: {
  "object": "list",
  "data": [
    #<Checkr::Candidate:0x3ff176151ca4 id=6be8ba695388837cb74bcc50> JSON: {
      "first_name": "John",
      "last_name": "Smith",
      "email": "john@smith.org",
      "phone": "5555555555",
      "dob": "1970-01-22",
      "ssn": "XXX-XX-6789",
      "copy_requested": false,
      "reports": {
        "object": "list",
        "data": []
      },
      "geos": {
        "object": "list",
        "data": []
      },
      "documents": {
        "object": "list",
        "data": []
      },
      "id": "6be8ba695388837cb74bcc50",
      "object": "test_candidate",
      "uri": "/v1/candidates/6be8ba695388837cb74bcc50",
      "created_at": "2015-03-23T11:24:18Z"
    },
    ...
  ]
}
```

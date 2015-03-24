# Document

## The Document Object

### Example Response

```ruby
#<Checkr::Document:0x3fd90aa3e10c id=e9293aac1d008123627c398f> JSON: {
  "download_uri": "https://checkr-documents.s3.amazonaws.com/candidates/e44aa283528e6fde7d542194/1427231857_mclovin.jpg?AWSAccessKeyId=AKIAJVBH7HZTOFURSXYQ&Expires=1427235458&Signature=7LPgGkve9SPnaMqozkV9%2BlL6luw%3D",
  "filesize": 37291,
  "filename": "1427231857_mclovin.jpg",
  "content_type": "image/jpeg",
  "id": "e9293aac1d008123627c398f",
  "object": "document",
  "uri": null,
  "created_at": "2015-03-24T21:17:38Z"
}
```



## Create a new Document

### Definition

```ruby
candidate = Checkr::Candidate.retrieve({CANDIDATE_ID})
candidate.documents.create
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

candidate = Checkr::Candidate.retrieve("e44aa283528e6fde7d542194")
document = Checkr::Document.create({
  :candidate_id => candidate.id,
  :type => "driver_license",
  :file => File.open("./mclovin.jpg")
})
```

### Example Response

```ruby
#<Checkr::Document:0x3fd90aa3e10c id=e9293aac1d008123627c398f> JSON: {
  "download_uri": "https://checkr-documents.s3.amazonaws.com/candidates/e44aa283528e6fde7d542194/1427231857_mclovin.jpg?AWSAccessKeyId=AKIAJVBH7HZTOFURSXYQ&Expires=1427235458&Signature=7LPgGkve9SPnaMqozkV9%2BlL6luw%3D",
  "filesize": 37291,
  "filename": "1427231857_mclovin.jpg",
  "content_type": "image/jpeg",
  "id": "e9293aac1d008123627c398f",
  "object": "document",
  "uri": null,
  "created_at": "2015-03-24T21:17:38Z"
}
```





## List a Candidate's Documents

### Definition

```ruby
candidate = Checkr::Candidate.retrieve({CANDIDATE_ID})
Checkr::Document.all({
  :candidate => candidate.id
})
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

candidate = Checkr::Candidate.retrieve("e44aa283528e6fde7d542194")
documents = Checkr::Document.all({
  :candidate_id => candidate.id
})
```

### Example Response

```ruby
 #<Checkr::DocumentList:0x3fd90a9bb93c> JSON: {
  "next_href": null,
  "previous_href": null,
  "count": 4,
  "object": "list",
  "data": [
    #<Checkr::Document:0x3fd909fa1320 id=a89c96f8ae80b961900ca8a3> JSON: {
	  "download_uri": "https://checkr-documents.s3.amazonaws.com/candidates/e44aa283528e6fde7d542194/1423684869_test.jpg?AWSAccessKeyId=AKIAJVBH7HZTOFURSXYQ&Expires=1427236003&Signature=kOYFewxbFn1%2FstvXEX1Y0V51sHY%3D",
	  "filesize": 8576,
	  "filename": "1423684869_test.jpg",
	  "content_type": "image/jpeg",
	  "id": "a89c96f8ae80b961900ca8a3",
	  "object": "document",
	  "uri": null,
	  "created_at": "2015-02-11T20:01:10Z"
	},
	...
  ]
}
```

# Base

## The Base Object

### Example Response

```ruby

```



## Create a new Base

### Definition

```ruby
Checkr::Base.create
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

base = Checkr::Base.create({

})
```

### Example Response

```ruby

```



## Retrieve an existing Base

### Definition

```ruby
Checkr::Base.retrieve({BASE_ID})
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

base = Checkr::Base.retrieve("4722c07dd9a10c3985ae432a")
```

### Example Response

```ruby

```

## Update an existing Base

### Definition

```ruby
base = Checkr::Base.retrieve({BASE_ID})
base.package = {NEW_PACKAGE}
base.save
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

base = Checkr::Base.retrieve("4722c07dd9a10c3985ae432a")
base.package = "driver_plus"
base.save
```

### Example Response

```ruby

```



## List existing Bases

### Definition

```ruby
Checkr::Base.all
```

### Example Request

```ruby
require 'checkr' # Note the gem is named checkr-official
Checkr.api_key = "83ebeabdec09f6670863766f792ead24d61fe3f9"

bases = Checkr::Base.all
```

### Example Response

```ruby

```

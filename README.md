# Checkr Ruby bindings [![Build Status](https://travis-ci.org/checkr/checkr-ruby.svg?branch=master)](https://travis-ci.org/checkr/checkr-ruby) [![Code Climate](https://codeclimate.com/github/checkr/checkr-ruby/badges/gpa.svg)](https://codeclimate.com/github/checkr/checkr-ruby)


## Installation

You don't need this source code unless you want to modify the gem. If
you just want to use the Checkr Ruby bindings, you should run:

```bash
gem install checkr-official
```

If you want to build the gem from source:

```bash
gem build checkr-official.gemspec
```


If you want to include the gem in IRB you will need to require `checkr`. This naming will hopefully be cleared up if we are given ownership of the `checkr` gem on rubygems.

```ruby
require 'checkr'
```


## Bundler

If you are installing via bundler, you should be sure to use the https
rubygems source in your Gemfile, as any gems fetched over http could potentially be compromised.

```ruby
source 'https://rubygems.org'

gem 'rails'
gem 'checkr-official'
```


## Development

Test cases can be run with: `bundle exec rake test`


## Test Rake Task

To hit the API with some test calls run:

```bash
bundle exec rake test_api["test_api_key"]
```

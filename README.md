# FieldSerializer

Ruby module which allows you to specify a set of fields that you'd like
serialized in the `#to_h` method. We ([EveryPolitician](http://everypolitician.org/))
are using this library in our scrapers to make them more declaritive. It allows
us to specify which fields we'd like to be scraped from a page without coupling
ourselves to how the page is fetched or where the data ends up being stored.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'field_serializer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install field_serializer

## Usage

```ruby
require 'field_serializer'

class Person
  include FieldSerializer

  field :name do
    'Alice'
  end

  field :fruit do
    :apple
  end
end

puts Person.new.to_h
# => { :name => "Alice", :fruit => :apple }
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/everypolitician/field_serializer.

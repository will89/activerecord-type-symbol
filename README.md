# ActiveRecord::Type::Symbol

[![Gem Version](https://badge.fury.io/rb/activerecord-type-symbol.svg)][gem]

[gem]: https://rubygems.org/gems/activerecord-type-symbol

Adds an ActiveRecord Symbol type to the ActiveRecord attributes API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'activerecord-type-symbol'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install activerecord-type-symbol

## Usage

```
require 'active_record-type-symbol'

class Post < ApplicationRecord
  # A database column 'post_type' can be used as a symbol by: 
  attribute :post_type, ActiveRecord::Type::Symbol.new
  # Or
  attribute :post_type, :symbol
  
  # Using a default value
  attribute :post_type, :symbol, default: :comment
  # If the post_type column has a nil value in the database
  # the post_type attribute will return nil.
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/will89/activerecord-type-symbol. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


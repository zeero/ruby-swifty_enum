[![Build Status](https://travis-ci.org/zeero/ruby-swifty_enum.svg?branch=master)](https://travis-ci.org/zeero/ruby-swifty_enum)
[![Code Climate](https://codeclimate.com/github/zeero/ruby-swifty_enum/badges/gpa.svg)](https://codeclimate.com/github/zeero/ruby-swifty_enum)
[![Test Coverage](https://codeclimate.com/github/zeero/ruby-swifty_enum/badges/coverage.svg)](https://codeclimate.com/github/zeero/ruby-swifty_enum/coverage)
[![Dependency Status](https://gemnasium.com/badges/github.com/zeero/ruby-swifty_enum.svg)](https://gemnasium.com/github.com/zeero/ruby-swifty_enum)
[![Gem Version](https://badge.fury.io/rb/swifty_enum.svg)](https://badge.fury.io/rb/swifty_enum)
[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE.txt)

# SwiftyEnum

SwiftyEnum enable defining enums in Ruby. Enums behave like Swift enums.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'swifty_enum'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install swifty_enum

## Usage

```ruby

# Define enum class.
class Flag

  # Required: Include SwiftyEnum module.
  include SwiftyEnum

  # Now you can define enum case by 'def_case' statement.
  #   Usage: def_case CASE_NAME [RAWVALUE]
  def_case 'On', '1'
  def_case 'Off', '0'

  # You can also define method for each enum cases by 'def_method' statement.
  # Please put this statement below all of 'def_case' statements.
  #   Usage: def_method METHOD_NAME { || ... }
  def_method 'status' do |enum_case|
    case enum_case
    when Flag::On then
      # You can't use return statement, but value of last statement is returned from enum method.
      'OK'
    when Flag::Off then
      'NG'
    end
  end
end


# Enum case is defined as subclass.
Flag::On                       # => Flag::On

# Enum case has class method 'hashvalue'.
# It is incremental value by enum case definition.
Flag::On.hashvalue             # => 0

# Enum case has class method 'rawvalue'.
# If rawvalue is not given in definition, hashvalue is used instead.
Flag::On.rawvalue              # => '1'

# Enum case can be gotten by 'get' method with rawvalue.
Flag.get('1')                  # => Flag::On
Flag.get('0')                  # => Flag::Off

# If invalid rawvalue is given, 'get' method returns nil.
Flag.get('2')                  # => nil

# Enum case can be handled with case-when statement.
on = Flag.get('1')
case on
when Flag::Off then
  puts 'NG'
when Flag::On then
  puts 'OK'
else
  puts 'NG'
end
# >> OK

# Enum method is defined in each enum cases.
Flag::On.status                # => 'OK'
Flag::Off.status               # => 'NG'

# When you want to get all of enum cases, use 'enum_cases'.
Flag.enum_cases                # => [Flag::On, Flag::Off]

```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/zeero/ruby-swifty_enum.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


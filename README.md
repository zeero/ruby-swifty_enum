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
# enum class
class Flag
  # Including SwiftyEnum module is required
  include SwiftyEnum

  # Now you can define enum cases. Usage: def_case CASE_NAME [CASE_VALUE]
  def_case 'On', '1'
  def_case 'Off', '0'

  # You can also define method for each enum cases. Usage: def_method METHOD_NAME &BLOCK
  # Please put this statement below all of 'def_case' statements
  def_method 'status' do |enum_case|
    case enum_case
    when Flag::On then
      # You can't use return statement, but value of last statement is returned from method actually
      'ok'
    when Flag::Off then
      'ng'
    end
  end
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/swifty_enum.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


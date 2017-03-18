require "simplecov"
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'swifty_enum'

require 'minitest/autorun'

class Flag
  include SwiftyEnum

  def_case 'On', '1'
  def_case 'Off', '0'
  def_case 'Dup', 'dup'

  def_method 'status' do |enum_case|
    case enum_case
    when Flag::On then
      'ok'
    when Flag::Off then
      'ng'
    else
      'unknown'
    end
  end
end

class EnumWithoutRawvalue
  include SwiftyEnum

  def_case 'First'
  def_case 'Second'

  def_method 'name' do |enum_case|
    case enum_case
    when EnumWithoutRawvalue::First then
      'First'
    when EnumWithoutRawvalue::Second then
      'Second'
    else
      'Unknown'
    end
  end
end


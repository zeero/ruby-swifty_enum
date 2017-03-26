require "simplecov"
SimpleCov.start

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'swifty_enum'

require 'minitest/autorun'

class Flag
  include SwiftyEnum

  def_case :On, '1'
  def_case :Off, '0'
  def_case :Dup, 'dup'

  def_method :status do |enum_case|
    case enum_case
    when On then
      'ok'
    when Off then
      'ng'
    else
      'unknown'
    end
  end
  
  def_method :status_with do |enum_case, args|
    if args.empty?
      enum_case.status
    else
      about = args.join(', ')
      "#{enum_case.status} with #{about}"
    end
  end
end

class EnumWithoutRawvalue
  include SwiftyEnum

  def_case :First
  def_case :Second

  def_method :name do |enum_case|
    case enum_case
    when First then
      'First'
    when Second then
      'Second'
    else
      'Unknown'
    end
  end
end


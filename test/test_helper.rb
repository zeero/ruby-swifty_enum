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


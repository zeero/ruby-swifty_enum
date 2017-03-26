# Module to be included in enum class.
#
# @author zeero

require "swifty_enum/version"
require "swifty_enum/messages"

module SwiftyEnum
  def self.included(klass)
    klass.extend ClassMethods
  end
  
  module ClassMethods

    # define enum case as subclass
    # @param [String] name     enum case name
    # @param [Object] rawvalue enum case rawvalue
    # @raise [RuntimeError] SwiftyEnum::Messages::ERR_DUPLICATE_ENUM_RAWVALUE
    def def_case(name, rawvalue = nil)
      @_enum_hash ||= {}
      hashvalue = @_enum_hash.size
      rawvalue ||= hashvalue

      # check rawvalue is unique
      if @_enum_hash.has_key? rawvalue
        raise sprintf(SwiftyEnum::Messages::ERR_DUPLICATE_ENUM_RAWVALUE, rawvalue)
      end

      klass = Class.new
      klass.define_singleton_method 'hashvalue' do
        return hashvalue
      end
      klass.define_singleton_method 'rawvalue' do
        return rawvalue
      end
      klass.define_singleton_method '===' do |rhs|
        return klass == rhs
      end
      const_set :"#{name}", klass

      @_enum_hash[rawvalue] = klass
    end

    # define enum method
    # @param [String] name enum method name
    def def_method(name)
      @_enum_hash ||= {}

      # check block given
      if ! block_given?
        raise SwiftyEnum::Messages::ERR_DEF_METHOD_WITHOUT_BLOCK
      end

      # check defined enum case existing
      if @_enum_hash.empty?
        raise SwiftyEnum::Messages::ERR_DEF_METHOD_FOR_EMPTY
      end

      @_enum_hash.values.each do |klass|
        klass.define_singleton_method name do |*args|
          yield klass, args
        end
      end
    end

    # get enum case
    # @param  [Object] rawvalue enum case rawvalue
    # @return [Class]  enum case
    def get(rawvalue)
      @_enum_hash ||= {}
      return @_enum_hash.fetch rawvalue, nil
    end

    # get all enum cases
    # @return [Array] enum cases
    def enum_cases
      return @_enum_hash.values
    end
  end
end


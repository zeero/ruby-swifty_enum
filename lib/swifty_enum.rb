require "swifty_enum/version"

module SwiftyEnum
  def self.included(klass)
    klass.extend ClassMethods
  end
  
  module ClassMethods

    # define enum case as subclass
    def def_case(name, rawvalue)
      # TODO: check name is uppercamelcase
      # TODO: check value is unique
      klass = Class.new
      klass.define_singleton_method 'rawvalue' do
        return rawvalue
      end
      klass.define_singleton_method '===' do |rhs|
        return klass == rhs
      end
      const_set :"#{name}", klass

      @_enum_hash ||= {}
      @_enum_hash[rawvalue] = klass
    end

    # define enum method
    def def_method(name)
      # TODO: if ! block_given?
      # TODO: check name is lowercamelcase
      @_enum_hash ||= {}
      @_enum_hash.values.each do |klass|
        klass.define_singleton_method name do
          yield klass
        end
      end
    end

    def get(rawvalue)
      @_enum_hash ||= {}
      return @_enum_hash.fetch rawvalue, nil
    end
  end
end


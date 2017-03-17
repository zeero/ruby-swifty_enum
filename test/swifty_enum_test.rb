require 'test_helper'

describe SwiftyEnum do
  before do
  end

  it 'has a version number' do
    refute_nil ::SwiftyEnum::VERSION
  end

  describe 'def_case' do
    it 'can define enum case as subclass' do
      refute_nil Flag::On
      refute_nil Flag::Off
    end

    describe 'defined enum case' do
      it 'has class method "rawvalue" that returns enum value' do
        assert_equal '1', Flag::On.rawvalue
        assert_equal '0', Flag::Off.rawvalue
      end

      it 'can be handled with switch statement' do
        on = Flag.get('1')
        case on
        when Flag::Off then
          assert false
        when Flag::On then
          assert true
        else
          assert false
        end

        unknown = Flag.get('2')
        case unknown
        when Flag::Off then
          assert false
        when Flag::On then
          assert false
        else
          assert true
        end
      end
    end

    it 'raise error when rawvalue is duplicated' do
      assert_raises RuntimeError, printf(SwiftyEnum::Messages::ERR_DUPLICATE_ENUM_RAWVALUE, 'Dup') do
        Flag.def_case 'Dup', 'dup'
      end
    end
  end

  describe 'get' do
    it 'returns enum case' do
      assert_equal Flag::On,  Flag.get('1')
      assert_equal Flag::Off, Flag.get('0')
    end

    it 'returns nil when given args is not exists in definition' do
      assert_nil Flag.get('2')
    end
  end

  describe 'def_method' do
    it 'can define method for each enum cases' do
      assert_equal 'ok', Flag.get('1').status
      assert_equal 'ng', Flag.get('0').status
    end

    it 'raise error when def_method is called without block' do
      assert_raises RuntimeError, SwiftyEnum::Messages::ERR_DEF_METHOD_WITHOUT_BLOCK do
        class Empty
          include SwiftyEnum
          def_method 'no_block'
        end
      end
    end

    it 'raise error when there is no defined enum case' do
      assert_raises RuntimeError, SwiftyEnum::Messages::ERR_DEF_METHOD_FOR_EMPTY do
        class Empty
          include SwiftyEnum
          def_method 'empty' do
            ''
          end
        end
      end
    end
  end

  describe 'enum_cases' do
    it 'returns list of defined enum case' do
      expected = [Flag::On, Flag::Off, Flag::Dup]
      assert_equal expected, Flag.enum_cases
    end
  end
end


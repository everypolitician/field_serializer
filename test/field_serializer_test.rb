require 'test_helper'

describe FieldSerializer  do
  it 'should have a version number' do
    FieldSerializer::VERSION.wont_be_nil
  end

  describe 'class with no fields' do
    class EmptyTestThing
      include FieldSerializer
    end

    describe '#to_h' do
      it 'should return an empty hash' do
        EmptyTestThing.new.to_h.must_equal({})
      end
    end
  end

  describe 'class with one field' do
    class OneFieldTestThing
      include FieldSerializer

      field :foo do
        :bar
      end
    end

    describe '#to_h' do
      it 'should return an empty hash' do
        OneFieldTestThing.new.to_h.must_equal foo: :bar
      end
    end
  end

  describe 'internal methods' do
    class InternalFieldTest
      include FieldSerializer

      field :constituency do
        'Bungudu'
      end

      field :state do
        'Zamfara'
      end

      field :area do
        [constituency, state].join(', ')
      end
    end

    it 'allows other fields to be accessed as methods' do
      InternalFieldTest.new.area.must_equal 'Bungudu, Zamfara'
    end
  end

  describe 'a subclass inheriting from a class that uses FieldSerializer' do
    class InheritanceTest
      include FieldSerializer

      field :constituency do
        'Bungudu'
      end
    end

    class InheritanceSubclassTest < InheritanceTest
      field :state do
        'Zamfara'
      end
    end

    class InheritanceSubclassTest2 < InheritanceTest
      field :constituency do
        'Chafe'
      end

      field :state do
        'Zamfara'
      end
    end

    class InheritanceSubclassTest3 < InheritanceSubclassTest2
      field :constituency do
        'Wibble'
      end

      field :district do
        'Bar'
      end
    end

    it 'should return fields defined by parent class in #to_h' do
      InheritanceSubclassTest.new.to_h.must_equal(constituency: 'Bungudu', state: 'Zamfara')
    end

    it 'should use its own field in favour of one with a matching name set in parent' do
      InheritanceSubclassTest2.new.to_h.must_equal(constituency: 'Chafe', state: 'Zamfara')
    end

    it 'should allow subclasses to be subclassed' do
      InheritanceSubclassTest3.new.to_h.must_equal(constituency: 'Wibble', state: 'Zamfara', district: 'Bar')
    end
  end
end

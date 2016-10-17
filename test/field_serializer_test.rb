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

  describe 'class with constructor arguments' do
    class ConstructorTestThing
      include FieldSerializer

      field :foo do
        subject.length
      end
    end

    it 'should return the length of the constructor argument' do
      ConstructorTestThing.new(subject: 'abc').to_h.must_equal foo: 3
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

  describe 'inheritance' do
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

    it 'returns fields from the parent class in #to_h' do
      InheritanceSubclassTest.new.to_h.must_equal(constituency: 'Bungudu', state: 'Zamfara')
    end

    it 'returns the field set in the subclass in #to_h' do
      InheritanceSubclassTest2.new.to_h.must_equal(constituency: 'Chafe', state: 'Zamfara')
    end
  end
end

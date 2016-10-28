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
end

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
end

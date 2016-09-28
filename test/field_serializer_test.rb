require 'test_helper'

describe FieldSerializer  do
  it 'should have a version number' do
    FieldSerializer::VERSION.wont_be_nil
  end

  class TestThing
    include FieldSerializer
  end

  describe '#to_h' do
    it 'should return an empty hash' do
      TestThing.new.to_h.must_equal({})
    end
  end
end

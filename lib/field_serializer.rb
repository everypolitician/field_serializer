require "field_serializer/version"

module FieldSerializer
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods
    def inherited(subclass)
      subclass.fields.concat(fields)
    end

    def fields
      @fields ||= []
    end

    def field(name, &block)
      fields << name
      define_method(name, &block)
    end

  end

  def to_h
    self.class.fields.map { |name|
      v = __send__(name)
      [name, v]
    }.to_h
  end
end

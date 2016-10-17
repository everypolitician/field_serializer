require "field_serializer/version"

module FieldSerializer
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  def initialize(options = {})
    options.each { |o, v| define_singleton_method(o) { v } }
  end

  module ClassMethods

    def fields
      @fields ||= []
    end

    def field(name, &block)
      fields << name
      define_method(name, &block)
    end

  end

  def to_h
    all_fields.map { |name|
      v = __send__(name)
      [name, v]
    }.to_h
  end

  private

  def all_fields
    super_fields + self.class.fields
  end

  def super_fields
    return [] unless superclass_implements_field_serializer?
    self.class.superclass.fields
  end

  def superclass_implements_field_serializer?
    superclass_responds_to?(:field, :fields)
  end

  def superclass_responds_to?(*methods)
    methods.reduce('true') do | r, method |
      r &&= self.class.superclass.respond_to? method
    end
  end
end

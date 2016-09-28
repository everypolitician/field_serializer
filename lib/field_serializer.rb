require "field_serializer/version"

module FieldSerializer
  def self.included(klass)
    klass.extend(ClassMethods)
  end

  module ClassMethods

    def fields
      @fields ||= {}
    end

    def field(name, &block)
      fields[name] = block
    end

  end

  def to_h
    self.class.fields.map { |name, block|
      v = instance_eval(&block) rescue nil
      [name, v]
    }.to_h
  end
end

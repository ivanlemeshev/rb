module Validation
  def self.included(base)
    class_variable_set(:@@validations, [])
    base.extend ClassMethods
    base.send :include, InstanceMethods
    base.send :include, Validators
  end

  module ClassMethods
    attr_reader :rules

    def validate(name, type, param = nil)
      validation = { name: name, type: type, param: param }
      validations = class_variable_get(:@@validations)
      validations << validation unless validations.include? validation
    end

  end

  module InstanceMethods
    def valid?
      validate!
    rescue
      false
    end

    protected

    def validate!
      self.class.class_variable_get(:@@validations).each do |options|
        send "validate_#{options[:type]}".to_sym, options
      end
    end
  end
end

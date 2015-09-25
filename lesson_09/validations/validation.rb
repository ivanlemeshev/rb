module Validation
  def self.included(base)
    base.instance_variable_set(:@validations, [])

    base.send(:define_method, :validations) do
      base.instance_variable_get(:@validations)
    end

    base.extend ClassMethods
    base.send :include, InstanceMethods
    base.send :include, Validators
  end

  module ClassMethods
    def validate(name, type, param = nil)
      add_validation(name: name, type: type, param: param)
    end

    def add_validation(validation)
      class_validations = instance_variable_get(:@validations)
      class_validations << validation unless class_validations.include? validation
      instance_variable_set(:@validations, class_validations)
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
      validations.each do |options|
        send "validate_#{options[:type]}".to_sym, options
      end
      true
    end
  end
end

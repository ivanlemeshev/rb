module Validation
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    attr_reader :rules

    def validate(name, type, param = nil)
      @rules ||= []
      @rules << { name: name, type: type, param: param }
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
      self.class.rules.each do |rule|
        case rule[:type]
        when :presence then validate_presence(rule[:name])
        when :format   then validate_format(rule[:name], rule[:param])
        when :type     then validate_type(rule[:name], rule[:param])
        end
      end
    end

    def validate_presence(name)
      fail "Attribute '#{name}' can not be blank." if empty?(name)
    end

    def validate_format(name, format)
      fail "Attribute '#{name}' has ivalid format." unless valid_format?(name, format)
    end

    def validate_type(name, type)
      fail "Attribute '#{name}' is not #{type}." unless valid_type?(name, type)
    end

    def empty?(name)
      var = instance_variable_get("@#{name}".to_sym)
      var.nil? || var == ""
    end

    def valid_format?(name, format)
      instance_variable_get("@#{name}".to_sym) =~ format
    end

    def valid_type?(name, type)
      instance_variable_get("@#{name}".to_sym).is_a? type
    end
  end
end

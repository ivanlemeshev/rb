module Validators
  module Unique
    def validate_unique(options)
      fail "Attribute '#{options[:name]}' already exists." unless unique?(options)
      attrs = self.class.class_variable_get(:@@attrs)
      attrs << instance_variable_get("@#{options[:name]}".to_sym)
      self.class.class_variable_set(:@@attrs, attrs)
    end

    def unique?(options)
      attrs = self.class.class_variable_get(:@@attrs)
      !attrs.include? instance_variable_get("@#{options[:name]}".to_sym)
    end
  end
end

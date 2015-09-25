module Validators
  module Type
    protected

    def validate_type(options)
      fail "Attribute '#{options[:name]}' is not #{options[:param]}." if invalid_type?(options)
    end

    def invalid_type?(options)
      !instance_variable_get("@#{options[:name]}").is_a? options[:param]
    end
  end
end

module Validators
  module Type
    def validate_type(options)
      fail "Attribute '#{options[:name]}' is not #{options[:type]}." unless valid_type?(options)
    end

    def valid_type?(options)
      instance_variable_get("@#{options[:name]}".to_sym).is_a? options[:param]
    end
  end
end

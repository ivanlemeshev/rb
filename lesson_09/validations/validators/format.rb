module Validators
  module Format
    def validate_format(options)
      fail "Attribute '#{options[:name]}' has ivalid format." unless valid_format?(options)
    end

    def valid_format?(options)
      instance_variable_get("@#{options[:name]}".to_sym) =~ options[:param]
    end
  end
end

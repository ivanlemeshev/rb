module Validators
  module Format
    protected

    def validate_format(options)
      fail "Attribute '#{options[:name]}' has invalid format." if ivalid_format?(options)
    end

    def ivalid_format?(options)
      instance_variable_get("@#{options[:name]}") !~ options[:param]
    end
  end
end

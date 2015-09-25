module Validators
  module Presence
    def validate_presence(options)
      fail "Attribute '#{options[:name]}' can not be blank." if empty?(options)
    end

    def empty?(options)
      var = instance_variable_get("@#{options[:name]}".to_sym)
      var.nil? || var == ""
    end
  end
end

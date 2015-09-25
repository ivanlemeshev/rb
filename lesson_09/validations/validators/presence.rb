module Validators
  module Presence
    protected

    def validate_presence(options)
      fail "Attribute '#{options[:name]}' can not be blank." if empty?(options)
    end

    def empty?(options)
      var = instance_variable_get("@#{options[:name]}")
      var.nil? || var.empty?
    end
  end
end

module Validators
  module Unique
    def self.included(base)
      base.instance_variable_set(:@unique_attrs, {})

      base.send(:define_method, :unique_attrs) do
        base.instance_variable_get(:@unique_attrs)
      end
    end

    protected

    def validate_unique(options)
      value = instance_variable_get("@#{options[:name]}")
      attrs = unique_attrs
      attrs[options[:name]] ||= []
      fail "Attribute `#{options[:name]} = #{value}` already exists." if not_unique?(options)
      attrs[options[:name]] << value
    end

    def not_unique?(options)
      unique_attrs[options[:name]].include? instance_variable_get("@#{options[:name]}")
    end
  end
end

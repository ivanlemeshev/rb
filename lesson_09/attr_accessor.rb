module AttrAccessor
  def attr_accessor_with_history(*names)
    names.each do |name|
      define_attr_history_reader(name)
      define_attr_reader(name)
      define_attr_writer_with_history(name)
    end
  end

  def strong_attr_accessor(attrs)
    attrs.each do |name, class_name|
      define_attr_reader(name)
      define_strong_attr_writer(name, class_name)
    end
  end

  protected

  def define_attr_history_reader(name)
    define_method("#{name}_history".to_sym) do
      instance_variable_get("@#{name}_history".to_sym) || []
    end
  end

  def define_attr_reader(name)
    define_method(name) { instance_variable_get("@#{name}".to_sym) }
  end

  def define_attr_writer_with_history(name)
    define_method("#{name}=".to_sym) do |value|
      history = instance_variable_get("@#{name}_history".to_sym) || []
      history << value
      instance_variable_set("@#{name}_history".to_sym, history)
      instance_variable_set("@#{name}".to_sym, value)
    end
  end

  def define_strong_attr_writer(name, class_name)
    define_method("#{name}=".to_sym) do |value|
      fail TypeError, "The value is not #{class_name}." unless value.is_a? class_name
      instance_variable_set("@#{name}".to_sym, value)
    end
  end
end

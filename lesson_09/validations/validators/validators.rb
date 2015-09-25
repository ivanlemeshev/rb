module Validators
  def self.included(base)
    class_variable_set(:@@attrs, [])
    base.send :include, Type
    base.send :include, Format
    base.send :include, Presence
    base.send :include, Unique
  end
end

module Validators
  def self.included(base)
    base.send :include, Type
    base.send :include, Format
    base.send :include, Presence
    base.send :include, Unique
  end
end

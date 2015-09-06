module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    @@instances = 0

    def instances
      @@instances
    end

    def instances=(count)
      @@instances = count
    end
  end
end

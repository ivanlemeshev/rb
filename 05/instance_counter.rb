module InstanceCounter
  def self.included(base)
    base.extend ClassMethods
    base.send :include, InstanceMethods
  end

  module ClassMethods
    @@instances = 0

    def instances
      @@instances
    end

    private

    def instances=(count)
      @@instances = count
    end
  end

  module InstanceMethods
    private

    def register_instance
      self.class.send :instances=, self.class.instances + 1
    end
  end
end

class CargoTrain < Train
  def initialize
    super
    @type = Train::TYPE_CARGO
  end

  def attach_wagon(wagon)
    if cargo_wagon?(wagon)
      super
    else
      puts "The wagon can not be attached. The wagon is not #{wagon.type}."
    end
  end

  def detach_wagon(wagon)
    if cargo_wagon?(wagon)
      super
    else
      puts "The wagon can not be detached. The wagon is not #{wagon.type}."
    end
  end

  private

  # method is used only in this class
  def cargo_wagon?(wagon)
    wagon.type == Wagon::TYPE_CARGO
  end
end

class CargoTrain < Train
  def initialize
    super
    @type = Train::TYPE_CARGO
  end
end

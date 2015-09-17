class CargoTrain < Train
  def initialize(number)
    super(number)
    @type = Train::TYPE_CARGO
  end
end

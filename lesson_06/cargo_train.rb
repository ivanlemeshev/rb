class CargoTrain < Train
  def initialize(number)
    super(number)
    super
    @type = Train::TYPE_CARGO
  end
end

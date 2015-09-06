class PassangerTrain < Train
  def initialize(number)
    super(number)
    @type = Train::TYPE_PASSANGER
  end
end

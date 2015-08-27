class PassangerTrain < Train
  def initialize
    super
    @type = Train::TYPE_PASSANGER
  end
end

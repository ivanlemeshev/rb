class Wagon
  include Manufacturer

  TYPE_CARGO = :cargo
  TYPE_PASSANGER = :passanger

  attr_reader :type

  def to_s
    "#{@type}"
  end
end

class Train
  include Validation
  include Manufacturer
  include InstanceCounter

  TYPE_CARGO = :cargo
  TYPE_PASSANGER = :passanger

  NUMBER_FORMAT = /^[a-z\d]{3}\-?[a-z\d]{2}$/i

  @@trains = {}

  attr_accessor :speed, :current_station, :previous_station, :next_station
  attr_reader :route, :type, :wagons, :number

  validate :number, :presence
  validate :number, :format, NUMBER_FORMAT
  validate :number, :unique

  def self.find(train_number)
    return @@trains.fetch(train_number) if @@trains.key?(train_number)
    nil
  end

  def initialize(number)
    @number = number
    validate!
    @wagons = []
    @speed = 0
    @@trains[self.number] = self
    self.class.instances += 1
  end

  def to_s
    "#{@number}"
  end

  def route=(route)
    @route = route
    self.current_station = self.route.stations.first
    set_positions
  end

  def set_positions
    @current_station.add_train(self)
    self.previous_station = @route.previous_station(@current_station)
    self.next_station = @route.next_station(@current_station)
  end

  def attach_wagon(wagon)
    validate_wagon(wagon)
    @wagons << wagon
  end

  def detach_wagon(wagon)
    validate_wagon(wagon)
    @wagons.delete(wagon)
  end

  def each_wagon(&block)
    @wagons.each { |wagon| block.call(wagon) }
  end

  def show_current_station
    puts @current_station || "There is no current station."
  end

  def show_previous_station
    puts @previous_station || "There is no previous station."
  end

  def show_next_station
    puts @next_station || "There is no next station."
  end

  def go_to_the_previous_station
    return unless @previous_station
    self.current_station = @previous_station
    set_positions
  end

  def go_to_the_next_station
    return unless @next_station
    self.current_station = @next_station
    set_positions
  end

  def increase_speed
    self.speed += 1
  end

  def stop
    self.speed = 0
  end

  protected

  def validate_wagon(wagon)
    fail 'invalid wagon' unless wagon.is_a? Wagon
    fail 'invalid wagon type' unless train_wagon?(wagon)
    fail 'the train is in motion' unless stopped?
  end

  def train_wagon?(wagon)
    wagon.type == @type
  end

  def stopped?
    self.speed == 0
  end
end

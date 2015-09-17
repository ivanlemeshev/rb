class Train
  include Manufacturer
  include InstanceCounter

  TYPE_CARGO = :cargo
  TYPE_PASSANGER = :passanger

  NUMBER_FORMAT = /^[a-z\d]{3}\-?[a-z\d]{2}$/i

  @@trains = {}

  attr_accessor :speed, :current_station, :previous_station, :next_station
  attr_reader :route, :type, :wagons, :number

  def initialize(number)
    @number = number
    validate!
    @wagons = []
    @speed = 0
    @@trains[self.number] = self
    self.class.instances += 1
  end

  def self.find(train_number)
    return @@trains.fetch(train_number) if @@trains.key?(train_number)
    nil
  end

  def valid?
    validate!
  rescue
    false
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
    if @current_station
      p @current_station
    else
      puts "There is no current station."
    end
  end

  def show_previous_station
    if @previous_station
      p @previous_station
    else
      puts "There is no previous station."
    end
  end

  def show_next_station
    if @next_station
      p @next_station.name
    else
      puts "There is no next station."
    end
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

  def validate!
    fail 'the number has invalid format' if number !~ NUMBER_FORMAT
    fail "the train #{number} already exists" if @@trains.key?(number)
    true
  end

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

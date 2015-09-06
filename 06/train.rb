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
    return @@trains.fetch(train_number) if @@trains.has_key?(train_number)
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
    self.current_station.add_train(self)
    self.previous_station = self.route.previous_station(self.current_station)
    self.next_station = self.route.next_station(self.current_station)
  end

  def attach_wagon(wagon)
    validate_wagon(wagon)
    @wagons << wagon
  end

  def detach_wagon(wagon)
    validate_wagon(wagon)
    @wagons.delete(wagon)
  end

  def show_current_station
    if self.current_station
      p self.current_station
    else
      puts "There is no current station."
    end
  end

  def show_previous_station
    if self.previous_station
      p self.previous_station
    else
      puts "There is no previous station."
    end
  end

  def show_next_station
    if self.next_station
      p self.next_station.name
    else
      puts "There is no next station."
    end
  end

  def go_to_the_previous_station
    if self.previous_station
      self.current_station = self.previous_station
      set_positions
    end
  end

  def go_to_the_next_station
    if self.next_station
      self.current_station = self.next_station
      set_positions
    end
  end

  def increase_speed
    self.speed += 1
  end

  def stop
    self.speed = 0
  end

  protected

  def validate!
    raise 'the number has invalid format' if number !~ NUMBER_FORMAT
    raise "the train with number #{number} already exists" if @@trains.has_key?(number)
    true
  end

  def validate_wagon(wagon)
    raise 'invalid wagon' unless wagon.is_a? Wagon
    raise 'invalid wagon type' unless train_wagon?(wagon)
    raise 'the train is in motion' unless stopped?
  end

  def train_wagon?(wagon)
    wagon.type == self.type
  end

  def stopped?
    self.speed == 0
  end
end

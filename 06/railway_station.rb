class RailwayStation
  NAME_MAX = 255
  NAME_MIN = 3
  NAME_FORMAT = /^[a-z\s\d]+$/i

  attr_reader :name, :trains

  @@stations = []

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
  end

  def valid?
    validate!
  rescue
    false
  end

  def self.all
    @@stations
  end

  def add_train(train)
    validate_train(train)
    self.trains << train
  end

  def send_train(train)
    self.trains.delete(train)
    train.current_station = nil
    train.previous_station = self
    train.next_station = train.route.next_station(self)
  end

  def show_trains
    if self.trains.empty?
      puts "There are no trains on the station."
    else
      self.trains.each { |train| p train }
    end
  end

  def show_trains_by_type(type)
    trains = trains_by_type(type)
    if trains.empty?
      puts "There are no #{type} trains on the railway station."
    else
      trains.each { |train| p train }
    end
  end

  private

  def validate!
    fail 'the name length must be more than or equal to 3 characters' if name.length < NAME_MIN
    fail 'the name length must be less than or equal to 255 characters' if name.length > NAME_MAX
    fail 'the name has invalid format' if name !~ NAME_FORMAT
    true
  end

  def validate_train(train)
    fail 'invalid train' unless train.is_a? Train
  end

  def trains_by_type(type)
    self.trains.select { |train| train.type == type }
  end
end

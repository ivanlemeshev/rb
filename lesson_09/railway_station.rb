class RailwayStation
  include Validation

  NAME_MAX = 255
  NAME_MIN = 3
  NAME_FORMAT = /^[A-Z\s\d]{3,255}$/i

  attr_reader :name, :trains

  validate :name, :type, String
  validate :name, :presence
  validate :name, :format, NAME_FORMAT
  validate :name, :unique

  @@stations = []

  def self.all
    @@stations
  end

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
  end

  def to_s
    "#{@name}"
  end

  def add_train(train)
    validate_train(train)
    @trains << train
  end

  def send_train(train)
    @trains.delete(train)
    train.current_station = nil
    train.previous_station = self
    train.next_station = train.route.next_station(self)
  end

  def show_trains
    if @trains.empty?
      puts "There are no trains on the station."
    else
      @trains.each { |train| p train }
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

  def each_train(&block)
    @trains.each { |train| block.call(train) }
  end

  private

  def validate_train(train)
    fail 'invalid train' unless train.is_a? Train
  end

  def trains_by_type(type)
    @trains.select { |train| train.type == type }
  end
end

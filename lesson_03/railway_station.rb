class RailwayStation
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    self.trains << train
    puts "The train is added to the station."
  end

  def send_train(train)
    self.trains.delete(train)
    train.current_station = nil
    train.previous_station = self
    train.next_station = train.route.next_station(self)
    puts "The train is sent from the station."
  end

  def show_trains
    if self.trains.empty?
      puts "There are no trains on the station."
    else
      self.trains.each_with_index do |train, index|
        puts "#{index + 1}. #{train.type} train with #{train.wagons} wagons."
      end
    end
  end

  def show_trains_by_type(type)
    trains = trains_by_type(type)
    if trains.empty?
      puts "There are no #{type} trains on the railway station."
    else
      trains.each_with_index do |train, index|
        puts "#{index + 1}. #{train.type} train with #{train.wagons} wagons."
      end
    end
  end

  def trains_by_type(type)
    self.trains.select { |train| train.type == type }
  end
end

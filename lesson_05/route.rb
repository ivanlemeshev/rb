class Route
  attr_reader :stations

  def initialize
    @stations = []
  end

  def show_stations
    if self.stations.empty?
      puts "There are no stations in the route."
    else
      self.stations.each { |station| puts station.name }
    end
  end

  def add_station(station)
    self.stations << station
    puts "The station #{station.name} is added to the route."
  end

  def delete_station(station)
    self.stations.delete(station)
    puts "The station #{station.name} is deleted from the route."
  end

  def previous_station(station)
    previous_index = self.stations.index(station) - 1
    return self.stations[previous_index] if previous_index >= 0
    nil
  end

  def next_station(station)
    next_index = self.stations.index(station) + 1
    return self.stations[next_index] if next_index < self.stations.size
    nil
  end
end

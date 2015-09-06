class Route
  attr_reader :stations

  def initialize
    @stations = []
  end

  def add_station(station)
    validate_station(station)
    self.stations << station
  end

  def delete_station(station)
    self.stations.delete(station)
  end

  def show_stations
    if self.stations.empty?
      puts 'There are no stations in the route.'
    else
      self.stations.each { |station| p station }
    end
  end

  def previous_station(station)
    station_index(station) do |index|
      previous_index = index - 1
      return self.stations[previous_index] if previous_index >= 0
    end
  end

  def next_station(station)
    station_index(station) do |index|
      next_index = index + 1
      return self.stations[next_index] if next_index < self.stations.size
    end
  end

  private

  def validate_station(station)
    fail 'ivalid station' unless station.is_a? RailwayStation
  end

  def station_index(station)
    station_index = self.stations.index(station)
    return nil unless station_index
    yield station_index
    nil
  end
end

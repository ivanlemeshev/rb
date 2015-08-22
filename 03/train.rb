class Train
  TYPE_PASSENGER = "passenger"
  TYPE_FREIGHT = "freight"

  attr_reader :speed, :wagons, :type, :route, :current_station, :previous_station, :next_station
  attr_writer :speed, :current_station, :previous_station, :next_station

  def initialize(type, wagons = 0)
    @type = type
    @wagons = wagons
    @speed = 0
    @current_station = nil
    @previous_station = nil
    @next_station = nil
  end

  def route=(route)
    @route = route
    puts "Route is added to the train."
    self.current_station = self.route.stations.first
    set_positions
  end

  def set_positions
    self.current_station.add_train(self)
    self.previous_station = self.route.previous_station(self.current_station)
    self.next_station = self.route.next_station(self.current_station)
  end

  def increase_speed
    self.speed += 1
    puts "Speed of the train is increased by 1."
  end

  def stop
    self.speed = 0
    puts "The train is stopped."
  end

  def stopped?
    self.speed == 0
  end

  def has_wangons?
    self.wagons > 0
  end

  def attach_wagon
    if stopped?
      @wagons += 1
      puts "New wagon is attached to the train."
    else
      puts "New wagon can not be attached, the train is in motion."
    end
  end

  def detach_wagon
    if stopped? && has_wangons?
      @wagons -= 1
      puts "The wagon is detached from the train."
    elsif !stopped?
      puts "The wagon can not be detached, the train is in motion."
    else
      puts "The wagon can not be detached, the train has no wagons."
    end
  end

  def show_current_station
    if self.current_station
      puts "Current station is #{self.current_station.name}."
    else
      puts "There is no current station."
    end
  end

  def show_previous_station
    if self.previous_station
      puts "Previous station is #{self.previous_station.name}."
    else
      puts "There is no previous station."
    end
  end

  def show_next_station
    if self.next_station
      puts "Next station is #{self.next_station.name}."
    else
      puts "There is no next station."
    end
  end

  def go_to_the_previous_station
    if self.previous_station
      self.current_station = self.previous_station
      set_positions
    else
      puts "There is no previous station."
    end
  end

  def go_to_the_next_station
    if self.next_station
      self.current_station = self.next_station
      set_positions
    else
      puts "There is no next station."
    end
  end
end

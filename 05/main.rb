require_relative './manufacturer.rb'
require_relative './instance_counter.rb'
require_relative './railway_station.rb'
require_relative './train.rb'
require_relative './passanger_train.rb'
require_relative './wagon.rb'
require_relative './passanger_wagon.rb'

wagon = PassangerWagon.new
wagon.manufacturer_name = "CAT"

train1 = PassangerTrain.new('1234')
train1.manufacturer_name = "CAT"

train2 = PassangerTrain.new('12345')
train2.manufacturer_name = "CAT"

train3 = PassangerTrain.new('123445')
train3.manufacturer_name = "CAT"

station1 = RailwayStation.new("Station1")
station2 = RailwayStation.new("Station2")
station2 = RailwayStation.new("Station2")

RailwayStation.all

p Train.find('1234')

p Train.find(123)

require_relative 'train'
require_relative 'railway_station'
require_relative 'route'

puts "Route initialization."
route = Route.new

puts "\nShowing stations of the route:"
route.show_stations

puts "\nStations initialization."
station1 = RailwayStation.new("Station1")
station2 = RailwayStation.new("Station2")
station3 = RailwayStation.new("Station3")
station4 = RailwayStation.new("Station4")
station5 = RailwayStation.new("Station5")
station6 = RailwayStation.new("Station6")

puts "\nAdding stations to the route."
route.add_station(station1)
route.add_station(station2)
route.add_station(station3)
route.add_station(station4)
route.add_station(station5)
route.add_station(station6)

puts "\nShowing stations of the route:"
route.show_stations

puts "\nDeleting some stations from the route."
route.delete_station(station3)
route.delete_station(station6)

puts "\nShowing stations of the route:"
route.show_stations

puts "\nTrains initialization."
passenger_train = Train.new(Train::TYPE_PASSENGER, 4)
freight_train = Train.new(Train::TYPE_FREIGHT, 6)

puts "\nAdding route to trains."
passenger_train.route = route
freight_train.route = route

puts "\nPassenger train positions."
passenger_train.show_previous_station
passenger_train.show_current_station
passenger_train.show_next_station

puts "\nShowing trains of the first route station."
station1.show_trains

puts "\nShowing freight trains of the first route station."
station1.show_trains_by_type(Train::TYPE_FREIGHT)

puts "\nSending of the passenger train from the first route station."
station1.send_train(passenger_train)

puts "\nShowing trains of the first route station."
station1.show_trains

puts "\nSending of the freight train from the first route station."
station1.send_train(freight_train)

puts "\nShowing trains of the first route station."
station1.show_trains

puts "\nPassenger train positions."
passenger_train.show_previous_station
passenger_train.show_current_station
passenger_train.show_next_station

puts "\nGoing to the next station."
passenger_train.go_to_the_next_station

puts "\nPassenger train positions."
passenger_train.show_previous_station
passenger_train.show_current_station
passenger_train.show_next_station

puts "\nGoing to the next station."
passenger_train.go_to_the_next_station

puts "\nPassenger train positions."
passenger_train.show_previous_station
passenger_train.show_current_station
passenger_train.show_next_station

puts "\nGoing to the next station."
passenger_train.go_to_the_next_station

puts "\nPassenger train positions."
passenger_train.show_previous_station
passenger_train.show_current_station
passenger_train.show_next_station

puts "\nGoing to the previous station."
passenger_train.go_to_the_previous_station

puts "\nPassenger train positions."
passenger_train.show_previous_station
passenger_train.show_current_station
passenger_train.show_next_station

puts "\nGoing to the previous station."
passenger_train.go_to_the_previous_station

puts "\nPassenger train positions."
passenger_train.show_previous_station
passenger_train.show_current_station
passenger_train.show_next_station

puts "\nGoing to the previous station."
passenger_train.go_to_the_previous_station

puts "\nPassenger train positions."
passenger_train.show_previous_station
passenger_train.show_current_station
passenger_train.show_next_station

puts "\nGoing to the previous station."
passenger_train.go_to_the_previous_station

puts "\nPassenger train positions."
passenger_train.show_previous_station
passenger_train.show_current_station
passenger_train.show_next_station

puts "\nThe passenger train speed is #{passenger_train.speed}."
puts "\nThe count of passenger wagons is #{passenger_train.wagons}."

passenger_train.increase_speed
puts "The train speed is #{passenger_train.speed}."

passenger_train.increase_speed
puts "The train speed is #{passenger_train.speed}."

passenger_train.increase_speed
puts "The train speed is #{passenger_train.speed}."

passenger_train.increase_speed
puts "The train speed is #{passenger_train.speed}."

passenger_train.stop
puts "The train speed is #{passenger_train.speed}."

passenger_train.attach_wagon
puts "The count of wagons is #{passenger_train.wagons}."

passenger_train.attach_wagon
puts "The count of wagons is #{passenger_train.wagons}."

passenger_train.detach_wagon
puts "The count of wagons is #{passenger_train.wagons}."

passenger_train.increase_speed
puts "The train speed is #{passenger_train.speed}."

passenger_train.increase_speed
puts "The train speed is #{passenger_train.speed}."

passenger_train.detach_wagon
puts "The count of wagons is #{passenger_train.wagons}."

passenger_train.increase_speed
puts "The train speed is #{passenger_train.speed}."

passenger_train.detach_wagon
puts "The count of wagons is #{passenger_train.wagons}."

passenger_train.detach_wagon
puts "The count of wagons is #{passenger_train.wagons}."

passenger_train.detach_wagon
puts "The count of wagons is #{passenger_train.wagons}."

passenger_train.detach_wagon
puts "The count of wagons is #{passenger_train.wagons}."

passenger_train.detach_wagon
puts "The count of wagons is #{passenger_train.wagons}."

passenger_train.detach_wagon
puts "The count of wagons is #{passenger_train.wagons}."

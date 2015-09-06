puts "Specify what goods you want to buy."
puts "Enter the 'stop' into the good name to end."

goods = {}

loop do
  print "\nPlease enter the good name: "
  good_name = gets.chomp

  break if good_name == "stop"

  goods[good_name] = {}

  print "Please enter the good price: "
  goods[good_name][:price] = gets.chomp.to_f.round(2)

  print "Please enter the quantity of goods: "
  goods[good_name][:quantity] = gets.chomp.to_i
end

puts "\n"
puts goods

full_price = 0

goods.each do |good_name, properties|
  full_good_price = properties[:price] * properties[:quantity]
  full_price += full_good_price
  puts "\nGood: #{good_name}"
  puts "Price #{sprintf('%.2f', full_good_price)}"
end

puts "\nFull price #{sprintf('%.2f', full_price)}"

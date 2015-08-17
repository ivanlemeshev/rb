numbers = (10..100).to_a.select { |n| n % 5 == 0 }
puts numbers.inspect

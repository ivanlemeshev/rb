def ideal_weight(height)
  height - 110
end

puts "What is your name?"
name = gets.chomp

puts "How tall are you? (in cm)"
height = gets.chomp.to_f

puts "Your ideal weight is #{ideal_weight(height)} kg."

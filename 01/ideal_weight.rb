def ideal_weight(height)
  height - 110
end

puts "What is your name?"
name = gets.chomp

puts "How tall are you? (in cm)"
height = gets.chomp.to_f

weight = ideal_weight(height)
puts "Your ideal weight is #{weight} kg."

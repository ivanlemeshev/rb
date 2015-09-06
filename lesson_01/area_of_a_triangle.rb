def area_of_a_triangle(base, height)
  1 / 2.0 * base * height
end

puts "Please enter the base of a triangle (in cm): "
base = gets.chomp.to_f

puts "Please enter the height of a triangle (in cm): "
height = gets.chomp.to_f

puts "The area of a triangle is #{area_of_a_triangle(base, height)} cm."

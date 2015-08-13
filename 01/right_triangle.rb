def max_of_three(a, b, c)
  [a, b, c].max
end

def right_triangle?(a, b, c)
  a**2 + b**2 == c**2
end

def isosceles_triangle?(a, b, c)
  (a == b) || (a == c) || (b == c)
end

puts "Please enter the first side of triangle (in cm):"
first_side = gets.chomp.to_f

puts "Please enter the second side of triangle (in cm):"
second_side = gets.chomp.to_f

puts "Please enter the third side of triangle (in cm):"
third_side = gets.chomp.to_f

max_side = max_of_three(first_side, second_side, third_side)

if (first_side == max_side) && right_triangle?(second_side, third_side, first_side)
  puts "The triangle is right."
elsif (second_side == max_side) && right_triangle?(first_side, third_side, second_side)
  puts "The triangle is right."
elsif (third_side == max_side) && right_triangle?(first_side, second_side, third_side)
  puts "The triangle is right."
else
  puts "The triangle is not right."
end

if isosceles_triangle?(first_side, second_side, third_side)
  puts "The triangle is isosceles."
else
  puts "The triangle is not isosceles."
end

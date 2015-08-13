def isosceles_triangle?(a, b, c)
  (a == b) && (a == c)
end

def right_triangle?(a, b, c)
  return false if isosceles_triangle?(a, b, c)
  sides = [a, b, c].sort
  sides[0]**2 + sides[1]**2 == sides[2]**2
end

puts "Please enter the first side of triangle (in cm):"
first_side = gets.chomp.to_f

puts "Please enter the second side of triangle (in cm):"
second_side = gets.chomp.to_f

puts "Please enter the third side of triangle (in cm):"
third_side = gets.chomp.to_f

if right_triangle?(second_side, third_side, first_side)
  puts "The triangle is right."
else
  puts "The triangle is not right."
end

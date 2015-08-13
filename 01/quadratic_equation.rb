def roots_of_a_quadratic_equation(a, b, c)
  d = b**2 - 4 * a * c

  return nil if d < 0

  x1 = (-b + Math.sqrt(d)) / 2 * a
  x2 = (-b - Math.sqrt(d)) / 2 * a

  [x1, x2]
end

puts "Please enter 'a' coefficient:"
a = gets.chomp.to_f

puts "Please enter 'b' coefficient:"
b = gets.chomp.to_f

puts "Please enter 'c' coefficient:"
c = gets.chomp.to_f

roots = roots_of_a_quadratic_equation(a, b, c);

if roots == nil
  puts "There are not roots."
else
  puts "The root x1: #{roots[0]}"
  puts "The root x2: #{roots[1]}"
end

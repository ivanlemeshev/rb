def divisible_by?(number, divider)
  number % divider == 0
end

def leap_year?(year)
  if !divisible_by?(year, 4)
    false
  elsif divisible_by?(year, 4) && !divisible_by?(year, 100)
    true
  elsif divisible_by?(year, 100) && !divisible_by?(year, 400)
    false
  else
    true
  end
end

def valid_year?(year)
  (year > 0) && (year < 3000)
end

def valid_month?(month)
  (month > 0) && (month < 13)
end

def valid_day?(day)
  (day > 0) && (day < 32)
end

def valid_day_of_month?(day, month, year)
  month_days = day_count_in_months(year)
  day <= month_days[month - 1]
end

def valid_date?(day, month, year)
  valid_day?(day) && valid_month?(month) && valid_year?(year) && valid_day_of_month?(day, month, year)
end

def day_count_in_months(year)
  month_days = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
  if leap_year?(year)
    month_days[1] += 1
    month_days
  else
    month_days
  end
end

def serial_number_of_the_date(day, month, year)
  serial_number = 0
  day_count_in_months(year).each_with_index do |count, index|
    if (index + 1) == month
      serial_number += day
    elsif (index + 1) < month
      serial_number += count
    end
  end
  serial_number
end

puts "Find the serial number of the date."

print "Please enter the day (in range 1-31): "
day = gets.chomp.to_i

print "Please enter the month (in range 1-12): "
month = gets.chomp.to_i

print "Please enter the year (in range 1-3000): "
year = gets.chomp.to_i

if valid_date?(day, month, year)
  puts "The serial number of the date is #{serial_number_of_the_date(day, month, year)}."
else
  puts "The date is incorrect."
end

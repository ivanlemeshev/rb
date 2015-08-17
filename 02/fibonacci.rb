def fib(number)
  raise ArgumentError, 'Argument is not Integer' unless number.is_a? Integer
  sequence = []
  return sequence if number < 0
  (number + 1).times do |i|
    if (i == 0) || (i == 1)
      sequence << i
    else
      sequence << sequence[i - 2] + sequence[i - 1]
    end
  end
  sequence
end

puts fib(100).inspect

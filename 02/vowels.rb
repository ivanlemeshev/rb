alphabet = ('a'..'z').to_a
volwes = ['a', 'e', 'i', 'o', 'u', 'y'].inject({}) do |result, letter|
  result.merge!({ letter => alphabet.index(letter) + 1 })
end
puts volwes

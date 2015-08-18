alphabet = ('a'..'z').to_a
volwes = {}
['a', 'e', 'i', 'o', 'u', 'y'].each do |letter|
  volwes[letter] = alphabet.index(letter) + 1 if alphabet.include?(letter)
end
puts volwes

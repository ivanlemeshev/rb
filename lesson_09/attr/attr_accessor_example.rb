require_relative "attr_accessor"

class AttrAccessorExample
  include AttrAccessor

  attr_accessor_with_history :tmp
  strong_attr_accessor name: String, count: Integer
end

example = AttrAccessorExample.new

example.tmp = 1
example.tmp = 2
example.tmp = 3
example.tmp = 4

p example.tmp_history

example.name = "Name"
example.count = 3

# example.name = 1231
# example.count = 21.32

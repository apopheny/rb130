=begin
Integer#times:

times {|i| block } → self
times → an_enumerator

Iterates the given block int times, passing in values from zero to int - 1.

If no block is given, an Enumerator is returned instead.

5.times {|i| print i, " " }   #=> 0 1 2 3 4
=end

def times(int)
  return Enumerator.new {} if block_given? == false
  
  counter = 0
  until counter == int
    yield(counter)
    counter += 1
  end

  int
end

p times(1)

times(5) do |num|
  puts num
end

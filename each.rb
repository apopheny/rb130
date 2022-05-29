=begin
 each {|element| ... } → self click to toggle source
each → Enumerator

Iterates over array elements.

When a block given, passes each successive array element to the block; returns self:

a = [:foo, 'bar', 2]
a.each {|element|  puts "#{element.class} #{element}" }

Output:

Symbol foo
String bar
Integer 2

Allows the array to be modified during iteration:

a = [:foo, 'bar', 2]
a.each {|element| puts element; a.clear if element.to_s.start_with?('b') }

Output:

foo
bar

When no block given, returns a new Enumerator:

a = [:foo, 'bar', 2]
e = a.each
e # => #<Enumerator: [:foo, "bar", 2]:each>
a1 = e.each {|element|  puts "#{element.class} #{element}" }

Output:

Symbol foo
String bar
Integer 2
=end

def each(arg)
  return Enumerator.new {} if block_given? == false

  counter = 0
  until counter == arg.size
    yield(arg[counter])
    counter +=1
  end

  arg
end

arr = [1, 2, 3, 4, 5]

each([1, 2, 3, 4, 5]) do |num|
  puts num
end

p each([1, 2, 3, 4, 5]) {|num| "do nothing"}.select{ |num| num.odd? }     # => [1, 3, 5]

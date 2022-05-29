=begin
 select {|element| ... } → new_array click to toggle source
select → new_enumerator

Calls the block, if given, with each element of self; returns a new Array containing those elements of self for which the block returns a truthy value:

a = [:foo, 'bar', 2, :bam]
a1 = a.select {|element| element.to_s.start_with?('b') }
a1 # => ["bar", :bam]

Returns a new Enumerator if no block given:

a = [:foo, 'bar', 2, :bam]
a.select # => #<Enumerator: [:foo, "bar", 2, :bam]:select>
=end

def select(arg)
  return Enumerator.new {} if block_given? == false

  counter = 0
  result = arg.class.new
  until counter == arg.size
    result << arg[counter] if yield(arg[counter])
    counter += 1
  end

  result
end

arr = [1, 2, 3, 4, 5]

p select(arr) { |element| element.odd? }
p select(arr) { |element| puts element }
p select(arr) { |element| element + 1 }

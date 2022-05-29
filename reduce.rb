=begin
 reduce(initial, sym) → obj click to toggle source
reduce(sym) → obj
reduce(initial) { |memo, obj| block } → obj
reduce { |memo, obj| block } → obj

Combines all elements of enum by applying a binary operation, specified by a block or a symbol that names a method or operator.

The inject and reduce methods are aliases. There is no performance benefit to either.

If you specify a block, then for each element in enum the block is passed an accumulator value (memo) and the element. If you specify a symbol instead, then each element in the collection will be passed to the named method of memo. In either case, the result becomes the new value for memo. At the end of the iteration, the final value of memo is the return value for the method.

If you do not explicitly specify an initial value for memo, then the first element of collection is used as the initial value of memo.

# Sum some numbers
(5..10).reduce(:+)                             #=> 45
# Same using a block and inject
(5..10).inject { |sum, n| sum + n }            #=> 45
# Multiply some numbers
(5..10).reduce(1, :*)                          #=> 151200
# Same using a block
(5..10).inject(1) { |product, n| product * n } #=> 151200
# find the longest word
longest = %w{ cat sheep bear }.inject do |memo, word|
   memo.length > word.length ? memo : word
end
longest                                        #=> "sheep"
=end

def reduce(obj, acc = omitted = true)
  return Enumerable.new {} if block_given? != true

  acc = obj[0] if omitted
  counter = omitted ? 1 : 0
  until counter == obj.size
    acc = yield(acc, obj[counter])
    counter += 1
  end
  
  acc
end

arr = [1, 2, 3]
p (reduce(arr, 1) do |acc, num|
  acc + num
end)

p (reduce(arr) do |acc, num|
  acc + num
end)

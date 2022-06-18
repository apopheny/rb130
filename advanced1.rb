factorial = Enumerator.new do |yielder|
  accumulator = 1
  num = 0
  loop do
    accumulator = (num.zero? ? accumulator : (accumulator * num))
    yielder << accumulator
    num += 1
  end
end

6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="
factorial.rewind
6.times { |number| puts "#{number}! == #{factorial.next}" }
puts "=========================="

factorial.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end

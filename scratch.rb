def sequence
  counter = 0
  a = Proc.new { 
    puts a
    counter += 1 
  }
end

s1 = sequence
s2 = sequence
3.times { puts s1.call }
3.times { puts s2.call }

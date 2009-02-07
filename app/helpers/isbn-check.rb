n = 0


s = '0201835959'

sum = 0
j = 10
seach_byte { |c|  
  puts c 
  sum = sum + c.to_i * j
  j -= 1
} 
puts sum % 11



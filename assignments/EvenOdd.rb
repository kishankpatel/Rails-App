def even_or_odd(val)
   if val % 2 == 0
      return "#{val} is even"
   end
   
   if val % 2 == 1
      return "#{val} is odd"
   end
end
print "Enter a number :\n"
vl = gets
y = vl.to_i
x = even_or_odd(y)
puts x
puts "Enter two values :"
x=gets.chomp.to_i
y=gets.chomp.to_i
puts "#{x}+#{y}=#{x+y}"
puts "#{x}-#{y}=#{x-y}"
puts "#{x}*#{y}=#{x*y}"
puts "#{x}/#{y}=#{x/y}"
puts "#{x}%#{y}=#{x%y}"
puts "#{x}^#{y}=#{x**y}"
if x > y	
	puts "#{x} is greater than #{y}"
elsif x < y	
	puts "#{x} is less than #{y}"
elsif x == y	
	puts "#{x} is equals to #{y}"
end
if x != y
	puts "#{x} is not equals to #{y}"
elsif x <= y
	puts "#{x} is less than or equals to #{y}"
elsif x >= y
	puts "#{x} is greater than or equals to #{y}"
end
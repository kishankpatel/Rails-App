puts "Enter a number :"
x = gets.chomp.to_i
if x % 2 == 0
	puts "#{x} is even number."
else
	puts "#{x} is odd number."
end
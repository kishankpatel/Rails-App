puts "Enter a number :"
x = gets.chomp.to_i
if x < 0
	puts "#{x} is a negative number."
else
	puts "#{x} is a positive number."
end
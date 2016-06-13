puts "Enter the range :"
range = gets.chomp.to_i
num_arr = Array.new()
puts "Enter #{range} values :"
i = 0
for i in i...range
	num_arr[i] = gets.chomp.to_i
end
i = 0
for i in i...range
	if num_arr[i] % 2 == 0
		puts "#{num_arr[i]} is even number."
	else
	puts "#{num_arr[i]} is odd number."
	end
end
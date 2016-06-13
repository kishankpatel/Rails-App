puts "Enter the range :"
range = gets.chomp.to_i
num_arr = Array.new(range)
puts "Enter #{range} values :"
for i in 0...range
	num_arr[i] = gets.to_i
	#puts i
end
j = 0
k = 0
count_odd = 0
count_even = 0
odd_arr = Array.new()
even_arr = Array.new()
for i in 0...range
	if num_arr[i] % 2 == 0
		count_odd += 1
		odd_arr[j]=num_arr[i]
		j += 1
	else
		count_even += 1
		even_arr[k] = num_arr[i]
		k += 1
	end
end
p odd_arr
p even_arr
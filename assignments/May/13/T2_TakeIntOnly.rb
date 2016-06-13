begin
	puts "Enter two integer value :"
	x = gets.chomp
	y = gets.chomp
	if (x.to_i.to_s != x) || (y.to_i.to_s != y)
		raise "Please enter number only"
	end
	a = x.to_i
	b = y.to_i
	for i in a..b
		puts "Numbers are #{i}"
	end
rescue Exception => e
	puts e.message
	retry
end
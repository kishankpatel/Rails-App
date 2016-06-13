print "Enter a number to check prime or  not : "
num = gets.chomp.to_i 
count = 0
(2..num/2).each do |i|
	if (num % i) == 0
		count += 1
		break
	end
	#puts "count :#{count}"
end

if count == 0
	puts "#{num} is a prime number."
else
	puts "#{num} is not a prime number."
end
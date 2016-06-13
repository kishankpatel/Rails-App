print "Enter time : "
gettime = gets.to_i 

case gettime
when 0..6, 22..24
	puts "Good Night"
when 7..11
	puts "Good Morning"
when 12
	puts "Good Noon"
when 13..17
	puts "Good Afternoon"
else
	puts "Good Evening"
end



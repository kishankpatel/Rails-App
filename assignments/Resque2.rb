begin 
	puts '...........Voting System.............' 
    print "Enter your name please : "
	name = gets.chomp
	print "How old are tou..? "
	age = gets.to_i
	puts "\n"
    if age<18
        raise 'An error has occurred...!!!' 
    end
    puts "Mr/Ms. #{name} you are able to caste vote."  
	puts "\n"
rescue  Exception => e
  puts e.message
	if age <= 0
		puts "Please enter a valid age."
		puts "\n"
	else
    puts "Mr/Ms. #{name} you have to wait another #{18-age} year/s to caste the vote."  
	puts "\n"
	end
	retry
end  
puts 'Thank you...'  
puts "\n"
begin
	n1=ARGV[0].to_f
	n2=ARGV[1].to_f
	if n2 == 0
		raise ZeroDivisionError
	end
	puts n1/n2
rescue Exception => e  
	 
end 
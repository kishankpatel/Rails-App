class User < ActiveRecord::Base
	before_save :set_user_neme
	before_validation :check_date_format
	before_save :set_age
	# after_validation :check_date

	validates_format_of :dob, :with => /\d{2}\/\d{2}\/\d{4}/, :message => "Date must be in the following format: mm/dd/yyyy"
	protected
	def set_user_neme
		self.username = self.name.downcase.gsub!(/\s+/, "_")
	end
	def check_date_format
		
	end
	def set_age
		if (dob = Date::strptime(self.dob, "%d/%m/%Y"))
			today = Date.today
			d = Date.new(today.year, dob.month, dob.day)
			self.age = d.year - dob.year - (d > today ? 1 : 0)
		else
			p '!!!!!!!!!!!!!!!!!!..........INVALID DATE.......!!!!!!!!!!!!!!!!!!!!!!!'
		end

	end	
end

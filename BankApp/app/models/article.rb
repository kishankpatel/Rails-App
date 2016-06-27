class Article < ActiveRecord::Base
	validate :name, uniqueness: true, length: { minimum: 5 }
	before_create :before_create_msg
  	after_save :after_save_msg
  	before_validation :before_validation_msg
  	after_validation :after_validation_msg
    validates :phone_no, exclusion: { :in => 1..9,
    message: "%{value} is reserved." }#, length: { minimum: 5 },:numericality => true

  	protected
    def before_create_msg
      p "================You are going to save========="
      self.name = "Mr/Ms " + self.name
    end
    def after_save_msg
      p "---------------Tou have saved successfully------------"
    end
    def before_validation_msg
    	p "*******************Your data is going to validate**********************"
    	self.name = self.name.upcase
    	p self.class
    end
    def after_validation_msg
    	p "*******************Your data has been validated successfully**********************"
    end
end

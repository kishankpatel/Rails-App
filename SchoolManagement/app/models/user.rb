class User < ActiveRecord::Base
	has_many :students, dependent: :destroy
	# has_many :teachers, dependent: :destroy

	
	validates :user_name, :uniqueness => true
  	validates :email, :uniqueness => true
end

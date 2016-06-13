class Book < ActiveRecord::Base
	validates :name, :uniqueness => true
	# validates_uniqueness_of :name, :scope => :author
end

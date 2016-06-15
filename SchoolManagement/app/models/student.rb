class Student < ActiveRecord::Base
	belongs_to :user
	has_and_belongs_to_many :subjects
	has_and_belongs_to_many :teachers
	belongs_to :standard
end

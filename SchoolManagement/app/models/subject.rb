class Subject < ActiveRecord::Base
	has_and_belongs_to_many :student
	has_and_belongs_to_many :standards
	has_and_belongs_to_many :teachers
end

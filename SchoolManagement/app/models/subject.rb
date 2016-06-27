class Subject < ActiveRecord::Base
	# has_and_belongs_to_many :standards
	has_many :standard_subjects
	has_many :standards, :through => :standard_subjects
end

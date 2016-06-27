class Standard < ActiveRecord::Base
	has_many :students, dependent: :destroy
	# has_and_belongs_to_many :subjects
	has_many :standard_subjects
	has_many :subjects, :through => :standard_subjects
end

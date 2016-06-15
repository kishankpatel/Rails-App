class Standard < ActiveRecord::Base
	has_many :students, dependent: :destroy
	has_and_belongs_to_many :subject
	has_and_belongs_to_many :teachers
end

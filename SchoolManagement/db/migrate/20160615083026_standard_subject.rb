class StandardSubject < ActiveRecord::Migration
  def change
  	create_table :standards_subjects do |t|
	  	t.belongs_to :standard, index: true
	  	t.belongs_to :subject, index: true
	end
  end
end

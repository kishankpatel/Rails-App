class CreateStandardSubjects < ActiveRecord::Migration
  def change
    create_table :standard_subjects do |t|
    	t.belongs_to :standard, index: true
	  	t.belongs_to :subject, index: true
      t.timestamps
    end
  end
end

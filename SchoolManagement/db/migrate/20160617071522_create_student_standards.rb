class CreateStudentStandards < ActiveRecord::Migration
  def change
    create_table :student_standards do |t|
    	t.belongs_to :student, index: true
		t.belongs_to :standard, index: true
      t.timestamps
    end
  end
end

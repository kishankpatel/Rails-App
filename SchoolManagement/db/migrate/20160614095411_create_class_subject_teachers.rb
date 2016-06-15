class CreateClassSubjectTeachers < ActiveRecord::Migration
  def change
    create_table :class_subject_teachers do |t|

      t.timestamps
    end
  end
end

class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
    	t.integer :user_id
    	t.string :name
    	t.integer :roll
      t.string :standard
      t.string :subjects
    	t.integer :age
    	t.string :gender
    	t.string :mobile
    	t.string :email
    	t.text :address
      t.timestamps
    end
  end
end

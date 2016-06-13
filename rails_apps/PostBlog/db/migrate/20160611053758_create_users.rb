class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :user_name
    	t.string :password
    	t.integer :age
    	t.string :email
    	t.string :phone_no
    	t.text :address
      t.timestamps
    end
  end
end

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :username
      t.string :password
      t.integer :age
      t.string :phoneno
      t.text :address
      t.timestamps
    end
  end
end


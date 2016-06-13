class ChangeFieldInUsers < ActiveRecord::Migration
  def change
  	change_column(:users, :phoneno, :string)
  end
end

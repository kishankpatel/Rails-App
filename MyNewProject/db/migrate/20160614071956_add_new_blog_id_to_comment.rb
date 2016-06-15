class AddNewBlogIdToComment < ActiveRecord::Migration
  def change
  	add_column :comments, :public_blog_id, :integer
  end
end

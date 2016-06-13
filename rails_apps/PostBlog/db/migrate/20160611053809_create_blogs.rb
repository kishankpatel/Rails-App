class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
    	t.string :user_id
    	t.string :blog
    	t.text :blog_description
      t.timestamps
    end
  end
end

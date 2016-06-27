class AddTitleToArticle < ActiveRecord::Migration
  def change
    # add_column :articles, :title, :string
    add_index :articles, :title
  end
end

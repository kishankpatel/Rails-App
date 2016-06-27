class AddPhonenoToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :phone_no, :string

  end
end

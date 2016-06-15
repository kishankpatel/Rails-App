class Comment < ActiveRecord::Base
	belongs_to :blog
	belongs_to :public_blog
	belongs_to :user
end

class User < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  validates :username, :uniqueness => true
  validates :email, :uniqueness => true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
end

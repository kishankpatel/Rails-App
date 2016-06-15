class User < ActiveRecord::Base
  has_many :orders, dependent: :destroy
  has_many :blogs, dependent: :destroy

  validates :username, :uniqueness => true
  validates :email, :uniqueness => true
  #EMAIL_REGEX = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i
  #validates :email, :presence => true, :uniqueness => true, :format => EMAIL_REGEX
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  # validates :email, email_format: { message: "doesn't look like an email address" }
  #validates :password, :confirmation => true #password_confirmation attr
  #validates_length_of :password, :in => 6..20#, :on => :create
  # validates :password, :length => { :minimum => 5, :maximum => 40 },
  # validates_confirmation_of :password
  # has_secure_password
  

end

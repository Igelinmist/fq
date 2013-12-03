class User < ActiveRecord::Base
  validates_presence_of :name, :subdivision
  validates :login, presence: true, uniqueness: true
  attr_accessible :last_login, :login, :login_count, :name, :password_digest, :password, :password_confirmation, :grants, :subdivision, :surname
  has_secure_password
end

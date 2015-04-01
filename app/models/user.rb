class User < ActiveRecord::Base
  has_many :friends
  has_many :comments
  has_secure_password
end

class User < ActiveRecord::Base

  validates :email, presence: true, uniqueness: true
  before_save{ |user| user.email = email.downcase}
  has_secure_password

end

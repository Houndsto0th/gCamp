class User < ActiveRecord::Base

  validates :email, format: /@/,  presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  before_save{ |user| user.email = email.downcase}
  has_secure_password

  has_many :comments
  has_many :memberships
  has_many :projects, through: :memberships

  def full_name
    "#{first_name} #{last_name}"
  end

end

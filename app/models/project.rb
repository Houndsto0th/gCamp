class Project < ActiveRecord::Base

  has_many :memberships
  has_many :tasks
  has_many :users, through: :memberships

  validates :proj_name, presence: true

end

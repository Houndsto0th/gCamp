class Membership < ActiveRecord::Base

  belongs_to :user
  belongs_to :project

  validates :user, presence: true
  validates :user, uniqueness: {scope: :project_id, message: "has already been added"}
  validates :role, presence: true


end

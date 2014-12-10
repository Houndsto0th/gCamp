class Project < ActiveRecord::Base

  has_many :memberships, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :users, through: :memberships

  validates :proj_name, presence: true

  def owner?(project)
    admin? || memberships.where(project_id: project.id, role:"owner").present?
  end

  def member?(project)
    projects.include?(project)
  end

end

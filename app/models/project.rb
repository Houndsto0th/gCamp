class Project < ActiveRecord::Base

  has_many :memberships
  has_many :tasks
  has_many :users, through: :memberships

  validates :proj_name, presence: true

  def owner?(project)
    admin? || memberships.where(project_id: project.id, role:"Owner").present?
  end

  def member?(project)
    projects.include?(project)
  end

end

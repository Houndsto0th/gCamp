class Task < ActiveRecord::Base

  has_many :comments
  belongs_to :project

  def isdue
    if self.due_date
      true if self.due_date <= Date.today+7
    else
      nil
    end
  end

  validates_date :due_date, on_or_after: lambda {Date.current}, on: :create
  validates :description, presence: true

  def member?(project)
    projects.include?(project)
  end
  

end

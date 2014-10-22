class Task < ActiveRecord::Base

  def isdue
    true if self.due_date <= Date.today+7
  end

end

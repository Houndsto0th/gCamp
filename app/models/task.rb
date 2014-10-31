class Task < ActiveRecord::Base

  def isdue
    if self.due_date
      true if self.due_date <= Date.today+7
    else
      nil
    end
  end



end

class RemoveProjectsid < ActiveRecord::Migration
  def change
    remove_column :tasks, :projects_id
  end
end

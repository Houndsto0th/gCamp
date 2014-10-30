class AddProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :proj_name
    end
  end
end

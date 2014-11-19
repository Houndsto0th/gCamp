class AddMemberships < ActiveRecord::Migration
  def change
    create_table :memberships do |t|
      t.string :role
      t.belongs_to :user
      t.belongs_to :project
    end
  end
end

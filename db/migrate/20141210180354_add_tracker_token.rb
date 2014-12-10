class AddTrackerToken < ActiveRecord::Migration
  def change
    add_column :users, :pivot_token, :string
  end
end

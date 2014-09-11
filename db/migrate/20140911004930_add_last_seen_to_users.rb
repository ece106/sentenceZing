class AddLastSeenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_seen, :integer
  end
end

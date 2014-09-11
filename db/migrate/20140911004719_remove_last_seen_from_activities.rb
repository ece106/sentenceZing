class RemoveLastSeenFromActivities < ActiveRecord::Migration
  def change
    remove_column :activities, :last_seen, :date_time
  end
end

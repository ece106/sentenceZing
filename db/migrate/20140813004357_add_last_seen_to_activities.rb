class AddLastSeenToActivities < ActiveRecord::Migration
  def change
    add_column :activities, :last_seen, :datetime
  end
end

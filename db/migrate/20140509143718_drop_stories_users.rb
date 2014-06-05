class DropStoriesUsers < ActiveRecord::Migration
  def change
    drop_table :stories_users
  end
end
class DropUserStories < ActiveRecord::Migration
  def change
    drop_table :user_stories
  end
end

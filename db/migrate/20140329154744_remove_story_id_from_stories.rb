class RemoveStoryIdFromStories < ActiveRecord::Migration
  def change
    remove_column :stories, :story_id, :integer
  end
end

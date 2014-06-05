class AddStoryIdToStories < ActiveRecord::Migration
  def change
    add_column :stories, :story_id, :integer
  end
end

class AddIndexToLikes < ActiveRecord::Migration
  def change
    add_index :likes, [:user_id, :story_id]
  end
end

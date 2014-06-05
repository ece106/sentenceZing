class FixLikesColumnName < ActiveRecord::Migration
  def change
    rename_column :likes, :likeable_id, :story_id
  end
end

class RemoveLikableTypeFromLikes < ActiveRecord::Migration
  def change
    remove_column :likes, :likable_type
  end
end

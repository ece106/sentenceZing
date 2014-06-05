class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :story_id
      t.integer :user_id
      
      t.timestamps
    end
    add_index :likes, [:user_id, :story_id]
  end
end

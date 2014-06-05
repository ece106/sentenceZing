class CreateStoriesUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :stories_users, id: false do |t|
      t.integer :story_id
      t.integer :user_id
      t.timestamps

    end

      add_index :stories_users, [:story_id, :user_id]
  end
end

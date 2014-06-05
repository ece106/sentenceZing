class AddUser2ToStories < ActiveRecord::Migration
  def change
    add_column :stories, :user2id, :integer
  end
end

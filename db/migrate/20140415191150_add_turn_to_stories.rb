class AddTurnToStories < ActiveRecord::Migration
  def change
    add_column :stories, :turn, :integer
  end
end

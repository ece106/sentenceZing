class AddAboutmeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :aboutme, :text
  end
end

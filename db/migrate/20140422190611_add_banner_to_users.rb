class AddBannerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :banner, :string
  end
end

class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.string :new
      t.string :create
      t.string :destroy

      t.timestamps
    end
  end
end

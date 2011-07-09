class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.boolean :viewed, :default => false
      t.integer :sharing_id

      t.timestamps
    end
  end
end

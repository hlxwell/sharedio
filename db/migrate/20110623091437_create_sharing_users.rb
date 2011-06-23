class CreateSharingUsers < ActiveRecord::Migration
  def change
    create_table :sharing_users do |t|
      t.integer :sharing_id
      t.integer :friend_id
      t.boolean :downloaded

      t.timestamps
    end
  end
end

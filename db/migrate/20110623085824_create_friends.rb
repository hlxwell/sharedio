class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.integer :group_id
      t.string :name
      t.string :email
      t.boolean :registered_user, :default => false

      t.timestamps
    end
  end
end

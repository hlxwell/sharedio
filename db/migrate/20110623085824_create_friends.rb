class CreateFriends < ActiveRecord::Migration
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.string :name
      t.string :email
      t.boolean :trust, :default => false
      t.timestamps
    end
  end
end

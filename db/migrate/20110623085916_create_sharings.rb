class CreateSharings < ActiveRecord::Migration
  def change
    create_table :sharings do |t|
      t.integer :user_id
      t.text :invitation_text

      t.timestamps
    end
  end
end

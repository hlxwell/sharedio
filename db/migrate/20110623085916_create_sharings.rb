class CreateSharings < ActiveRecord::Migration
  def change
    create_table :sharings do |t|
      t.integer :user_id
      t.text :invitation_text
      t.integer :total_file_count, :default => 0
      t.integer :uploaded_file_count, :default => 0
      t.timestamps
    end
  end
end

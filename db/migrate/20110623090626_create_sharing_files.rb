class CreateSharingFiles < ActiveRecord::Migration
  def change
    create_table :sharing_files do |t|
      t.integer :sharing_id
      t.string :folder
      t.string :file
      t.integer :downloads_count

      t.timestamps
    end
  end
end

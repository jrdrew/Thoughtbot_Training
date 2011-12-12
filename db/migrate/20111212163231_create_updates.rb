class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
      t.string :content_type
      t.integer :content_id
      t.belongs_to :user

      t.timestamps
    end
    add_index :updates, :user_id
  end
end

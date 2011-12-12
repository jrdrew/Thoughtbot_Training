class AddAttachmentAttachmentOneToPhoto < ActiveRecord::Migration
  def self.up
    add_column :photos, :attachment_one_file_name, :string
    add_column :photos, :attachment_one_content_type, :string
    add_column :photos, :attachment_one_file_size, :integer
    add_column :photos, :attachment_one_updated_at, :datetime
  end

  def self.down
    remove_column :photos, :attachment_one_file_name
    remove_column :photos, :attachment_one_content_type
    remove_column :photos, :attachment_one_file_size
    remove_column :photos, :attachment_one_updated_at
  end
end

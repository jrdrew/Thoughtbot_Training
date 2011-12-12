class InsertPostsIntoUpdates < ActiveRecord::Migration
  def up
    select_rows("SELECT id, user_id, created_at FROM posts").each do | row |
      insert("INSERT INTO updates(content_type, content_id, user_id, created_at) VALUES('Post', '#{row[0]}', '#{row[1]}', '#{row[2]}')")
    end
    remove_column :posts, :user_id
  end

  def down
    add_column :posts, :user_id, :integer
    select_rows("SELECT content_id, user_id FROM updates").each do | row |
      update("UPDATE posts SET user_id = '#{row[1]}' WHERE id = '#{row[0]}'")
    end
    delete("DELETE FROM updates")
  end
end

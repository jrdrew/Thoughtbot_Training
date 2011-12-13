class Feed
  
  def initialize(user_ids)
    @user_ids = user_ids
  end
  
  def updates
    Update.where(:user_id => @user_ids).most_recent
  end
  
  def search(input)
    feed = Update.joins("JOIN posts ON updates.content_type = 'Post' AND updates.content_id = posts.id").where("posts.body LIKE ?", "%#{input}%").most_recent
#    Post.search(input).map(&:update)
  end
    
end
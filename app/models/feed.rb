class Feed
  def self.my_feed(user)
    user.updates.most_recent
  end
  
  def self.friends_feed(user)
    user.friends.inject([]) {|updates, friend| updates += friend.updates.most_recent}
  end
  
  def self.user_and_friends_feed(user)
    feed = my_feed(user) + friends_feed(user)
    feed.sort! { |a, b| b.created_at <=> a.created_at }
  end
    
end
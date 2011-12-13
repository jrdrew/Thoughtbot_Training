require 'spec_helper'

describe Update do
  describe "most_recent" do
    it "the order is most recent on top one user's content" do
      user = Factory(:user)
      another_user = Factory(:user)
      
      update1 = Factory(:post)
      update2 = Factory(:post)
      update3 = Factory(:post)
      
      update4 = Factory(:post)
      update5 = Factory(:post)
      update6 = Factory(:post)
      
      user.updates.create(content: update1)
      user.updates.create(content: update2)
      user.updates.create(content: update3)
      
      another_user.updates.create(content: update4)
      another_user.updates.create(content: update5)
      another_user.updates.create(content: update6)

      result = Update.most_recent
      result.size.should be(6)
      
      result2 = user.updates.most_recent
      result2.size.should be(3)
      
      Feed.my_feed(user).size.should be(3)
      Feed.friends_feed(user).size.should be(0)
      
      
    end
    
    it "the order is most recent on top two user's content" do
      user = Factory(:user)
      friend = Factory(:user)
      
      user.friendships.create(friend: friend)
      
      update1 = Factory(:post)
      update2 = Factory(:post)
      update3 = Factory(:post)
      
      first_saved_post = user.updates.create(content: update1)
      user.updates.create(content: update2)
      user.updates.create(content: update3)

      friend.updates.create(content: update1)
      friend.updates.create(content: update2)
      last_saved_post = friend.updates.create(content: update3)

      Update.most_recent.size.should be(6)
      
      Feed.friends_feed(user).size.should be(3)
      
      Feed.friends_feed(friend).size.should be(0)
      
      Feed.user_and_friends_feed(user).size.should be(6)
      
      feed = Feed.user_and_friends_feed(user)
      
      first_post = feed.first
      first_post.user_id.should eq(friend.id)
      first_post.id.should eq(last_saved_post.id)
      
      last_post = feed.last
      last_post.user_id.should eq(user.id)
      last_post.id.should eq(first_saved_post.id)
      
    end
  end
end

require 'spec_helper'

describe Update do
  describe "most_recent" do
    it "the order is most recent on top one user's content" do
      
      
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
      
      
      
    end
  end
end

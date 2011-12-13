require 'spec_helper'

describe Friendship do
  context "#can_follow?" do
    it "user is same as current user" do
      user = Factory(:user)
      
      user.can_follow?(user).should be_false
    end
    
    it "user is already following current user" do
      user = Factory(:user)
      friend = Factory(:user)
      user.friendships.create(friend: friend)
      user.can_follow?(friend).should be_false
    end
    
    it "user can follow current user " do
      user = Factory(:user)
      friend = Factory(:user)
      
      user.can_follow?(friend).should be_true
    end
  end
  
  context "#friends_and_my_id" do
    it "user with no friends" do
      user = Factory(:user)
      
      ids = user.self_and_friend_ids
      ids.should == [user.id]
    end
    
    it "user with friends" do
      user = Factory(:user)
      friend = Factory(:user)
      user.friendships.create(friend: friend)
      
      ids = user.self_and_friend_ids
      ids.should == [friend.id, user.id]
    end
  end
end

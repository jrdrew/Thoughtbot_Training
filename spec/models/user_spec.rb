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
end

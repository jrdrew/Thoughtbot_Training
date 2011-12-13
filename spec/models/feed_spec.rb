require 'spec_helper'

describe Feed do
  context "updates" do
    it "returns all the updates for one user id" do
      user = Factory(:user)
      
      update1 = Factory(:post)
      update2 = Factory(:post)
      update3 = Factory(:post)
      
      first_saved_post = user.updates.create(content: update1)
      second_saved_post = user.updates.create(content: update2)
      last_saved_post = user.updates.create(content: update3)
      
      
      feed = Feed.new(user.id)
      
      feed.updates.should == [last_saved_post, second_saved_post, first_saved_post]
      
      
    end
    
    it "returns all the updates for all of the user ids" do
      user = Factory(:user)
      friend = Factory(:user)
      
      user.friendships.create(friend: friend)
      
      update1 = Factory(:post)
      update2 = Factory(:post)
      update3 = Factory(:post)
      
      first_saved_post = user.updates.create(content: update1)
      second_saved_post = user.updates.create(content: update2)
      third_saved_post = user.updates.create(content: update3)

      fourth_saved_post = friend.updates.create(content: update1)
      fifth_saved_post = friend.updates.create(content: update2)
      last_saved_post = friend.updates.create(content: update3)

      Update.most_recent.size.should be(6)
      
      user_feed = Feed.new(user.id)
      user_feed.updates.size.should be(3)
      
      friend_feed = Feed.new(friend.id)
      friend_feed.updates.size.should be(3)
      
      user_and_friend_feed = Feed.new([user.id, friend.id])
      user_and_friend_feed.updates.size.should be(6)
      user_and_friend_feed.updates.first.should == last_saved_post
      user_and_friend_feed.updates.should == [last_saved_post, fifth_saved_post, fourth_saved_post, third_saved_post, second_saved_post, first_saved_post ]
      
    end
    
    
  end
  
  context "#search" do
    it "search for a record which doesn't exist" do
      user = Factory(:user)
      update1 = Factory(:post)
      first_saved_post = user.updates.create(content: update1)
      
      feed = Feed.new(user.id)
      feed.search("something not there").should == []
    end
    
    it "search for a record which does exist" do
      user = Factory(:user)
      update1 = Factory(:post)
      first_saved_post = user.updates.create(content: update1)
      feed = Feed.new(user.id)
      feed.search(update1.body).should == [first_saved_post]
    end
  end
end
class DashboardsController < ApplicationController
  def show
    @post = Post.new
    @photo = Photo.new
    @updates = Feed.user_and_friends_feed(current_user)
    
    @friends = current_user.friends
    @followers = current_user.followers
  end
end
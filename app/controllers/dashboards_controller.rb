class DashboardsController < ApplicationController
  def show
    respond_to do | format |
      feed = Feed.new(current_user.self_and_friend_ids)
      @updates = feed.updates
      format.html do
        @post = Post.new
        @photo = Photo.new
        
        
        @updates = feed.updates
        
        @friends = current_user.friends
        @followers = current_user.followers
      end
      format.json { render json: @updates.as_json(:include => :content)}
    end

    
  end
end
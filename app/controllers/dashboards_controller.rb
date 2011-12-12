class DashboardsController < ApplicationController
  def show
    @post = Post.new
    @photo = Photo.new
    @updates = current_user.updates.most_recent
  end
end
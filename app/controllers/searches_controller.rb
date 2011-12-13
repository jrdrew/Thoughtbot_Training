class SearchesController < ApplicationController
  def show
    feed = Feed.new(current_user.id)
    @updates = feed.search(params[:q])
  end
end
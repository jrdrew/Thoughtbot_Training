class PostsController < ApplicationController
  def create
    @post = Post.new(params[:post])
    @update = current_user.updates.build(content: @post)
    if @update.save
      redirect_to dashboard_path
    else
      flash.now[:notice] = "Could not save post"
      render "dashboards/show"
    end
  end
end
class PhotosController < ApplicationController
  def create
    @photo = Photo.new(params[:photo])
    @update = current_user.updates.build(content: @photo)
    if @update.save
      redirect_to dashboard_path
    else
      flash.now[:notice] = "Could not save photo"
      render "dashboards/show"
    end
  end
end
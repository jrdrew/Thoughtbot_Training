class UsersController < ApplicationController
  
  respond_to :html, :json
  def show
    @user = User.find(params[:id])
    @updates = @user.updates.most_recent
    respond_with(@updates)
  end
end
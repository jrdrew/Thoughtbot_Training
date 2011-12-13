class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @updates = @user.updates.most_recent
    
  end
end
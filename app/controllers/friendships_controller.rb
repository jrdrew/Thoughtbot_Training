class FriendshipsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    current_user.friendships.create(friend: @user)
    redirect_to @user, notice: "Now following #{@user.email}"
  end
end
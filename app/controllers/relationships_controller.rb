class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  def create
    current_user.follow(params[:account_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:account_id])
    redirect_to request.referer
  end

  def follows
    user = User.find(params[:account_id])
    @users = user.follows
  end

  def followers
    user = User.find(params[:account_id])
    @users = user.followers
  end
end

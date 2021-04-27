class AccountsController < ApplicationController

  def index
    @users = User.where(is_farmer: "true")
  end

  def show
    @user = User.find(params[:id])
    @myrecipes = Recipe.where(user_id: @user.id)
    @pick_up = Recipe.where(user_id: @user.id, recommend: true)
    @crops = Crop.where(user_id: @user.id)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(account_params)
    redirect_to account_path(current_user)
  end

  def quit
    @user = current_user
  end

  def out
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def account_params
    params.require(:user).permit(:first_name, :first_name_kana, :last_name, :last_name_kana, :introduction, :email, :nickname, :image)
  end
end

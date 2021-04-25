class Admins::AccountsController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(account_params)
    redirect_to admins_account_path(@user)
  end

  def destroy
  end


  private

  def account_params
    params.require(:user).permit(:first_name, :first_name_kana, :last_name, :last_name_kana, :email, :nickname, :is_farmer, :is_deleted)
  end
end

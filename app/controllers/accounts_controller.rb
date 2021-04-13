class AccountsController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(account_params)
    redirect_to account_path(current_user)
  end


  private

  def account_params
    params.require(:user).permit(:first_name, :first_name_kana, :last_name, :last_name_kana, :introduction, :email)
  end
end
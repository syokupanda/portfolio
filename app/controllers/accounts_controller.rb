class AccountsController < ApplicationController

  def show
    @user = User.find(params[:id])
    @myrecipes = Recipe.where(user_id: @user.id)
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
    params.require(:user).permit(:first_name, :first_name_kana, :last_name, :last_name_kana, :introduction, :email, :nickname, :image)
  end
end

class CropsController < ApplicationController
  def index
    @crops = Crop.where(user_id: params[:account_id])
  end

  def new
    @crop = Crop.new
  end

  def create
    @crop = Crop.new(crop_params)
    @crop.save
    redirect_to account_crops_path(current_user.id)
  end

  def edit
    @crop = Crop.find(params[:id])
  end

  def update
    @crop = Crop.find(params[:id])
    @crop.update(crop_params)
    redirect_to account_crops_path(current_user.id)
  end

  def destroy
    @crop = Crop.find(params[:id])
    @crop.destroy
    redirect_to account_crops_path(current_user.id)
  end


  private

  def crop_params
    params.require(:crop).permit(:user_id, :image, :introduction)
  end
end

class MakingsController < ApplicationController
  def new
    @making = Making.new
  end

  def create
    @making = Making.new(making_params)
    @making.save
    redirect_to recipes_path
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def recipe_params
    params.require(:making).permit(:recipe_id, :image, :process)
  end

end

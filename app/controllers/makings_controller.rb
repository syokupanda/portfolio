class MakingsController < ApplicationController
  def new
    @making = Making.new
    @recipe = Recipe.find(params[:recipe_id])
  end

  def create
    @making = Making.new(making_params)
    @making.recipe_id = params[:recipe_id]
    @making.save
    redirect_to recipe_path(params[:recipe_id])
  end

  def edit
  end

  def update
  end

  def destroy
  end


  private

  def making_params
    params.require(:making).permit(:recipe_id, :image, :process)
  end

end

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
    @making = Making.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  def update
    @making = Making.find(params[:id])
    @making.update(making_params)
    redirect_to recipe_path(params[:recipe_id])
  end

  def destroy
    @making = Making.find(params[:id])
    @making.destroy
    redirect_to recipe_path(params[:recipe_id])
  end


  private

  def making_params
    params.require(:making).permit(:recipe_id, :image, :process)
  end

end

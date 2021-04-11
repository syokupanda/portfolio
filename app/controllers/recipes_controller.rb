class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.save
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
    params.require(:recipe).permit(:user_id, :image, :introduction, :name)
  end

end

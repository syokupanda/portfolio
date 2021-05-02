class RecipesController < ApplicationController
  def index
    @search = Recipe.ransack(params[:q])
    @recipes = @search.result(distinct: true)
  end

  def category_index
    @recipes = Recipe.where(category_id: params[:category_id])
  end

  def show
    @recipe = Recipe.find(params[:id])
    @review = Review.new
    @making = Making.where(recipe_id: @recipe)
    @user = User.find(@recipe.user_id)
  end

  def new
    @recipe = Recipe.new
    @categories = Category.all
  end

  def create
    @recipe = Recipe.new(recipe_params)

    if @recipe.save
       tags = Vision.get_image_data(@recipe.image)
        tags.each do |tag|
          @recipe.recipe_ai_tags.create(name: tag)
        end
      redirect_to new_recipe_making_path(@recipe.id)
    else
      flash[:error] = "必須項目を入力してください"
      redirect_to new_recipe_path
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
    @categories = Category.all
  end

  def update
    @recipe = Recipe.find(params[:id])
    byebug
    if @recipe.update(recipe_params)
      @recipe.recipe_ai_tags.destroy_all
      tags = Vision.get_image_data(@recipe.image)
        tags.each do |tag|
          @recipe.recipe_ai_tags.create(name: tag)
        end
      redirect_to recipe_path(@recipe.id)
    else
      flash[:error] = "必須項目を入力してください"
      redirect_to edit_recipe_path(@recipe)
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end


  private

  def recipe_params
    params.require(:recipe).permit(:user_id, :image, :introduction, :name, :tag_list, :ingredients, :category_id, :recommend)
  end

end

class ReviewsController < ApplicationController
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = current_user.reviews.new(review_params)
    @review.recipe_id = @recipe.id
    @review.save
    redirect_to recipe_path(@recipe)
  end

  def destroy
    Review.find_by(id: params[:id], recipe_id: params[:recipe_id]).destroy
    redirect_to recipe_path(params[:recipe_id])
  end


  private

  def review_params
    params.require(:review).permit(:rate, :comment)
  end
end

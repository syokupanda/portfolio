class AddRateToReview < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :rate, :float
    add_column :reviews, :comment, :text
    add_column :reviews, :user_id, :integer
    add_column :reviews, :recipe_id, :integer
    
  end
end

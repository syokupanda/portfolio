class AddRecommendToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :recommend, :boolean, default: false
    add_column :recipes, :bookmark, :boolean, default: false
  end
end

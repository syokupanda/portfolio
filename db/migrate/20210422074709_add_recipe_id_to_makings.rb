class AddRecipeIdToMakings < ActiveRecord::Migration[5.2]
  def change
    add_column :makings, :recipe_id, :integer
  end
end

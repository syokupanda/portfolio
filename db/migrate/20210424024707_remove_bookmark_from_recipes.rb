class RemoveBookmarkFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :bookmark, :boolean
  end
end

class Recoedsfood < ActiveRecord::Migration[5.2]
  def change
    drop_table :foods
    drop_table :recipe_foods
    drop_table :farmers
  end
end

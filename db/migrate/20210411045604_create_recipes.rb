class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.integer :user_id
      t.string :image_id
      t.string :introduction

      t.timestamps
    end
  end
end

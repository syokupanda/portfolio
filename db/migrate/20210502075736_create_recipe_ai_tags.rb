class CreateRecipeAiTags < ActiveRecord::Migration[5.2]
  def change
    create_table :recipe_ai_tags do |t|
      t.string :name
      t.integer :recipe_id

      t.timestamps
    end
  end
end

class CreateCrops < ActiveRecord::Migration[5.2]
  def change
    create_table :crops do |t|
      t.string :image_id
      t.text :introduction

      t.timestamps
    end
  end
end

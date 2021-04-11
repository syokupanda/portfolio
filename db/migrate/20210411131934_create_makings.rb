class CreateMakings < ActiveRecord::Migration[5.2]
  def change
    create_table :makings do |t|
      t.string :image_id
      t.text :process

      t.timestamps
    end
  end
end

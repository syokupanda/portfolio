class AddUseIdToCrops < ActiveRecord::Migration[5.2]
  def change
    add_column :crops, :user_id, :integer
  end
end

class ChengeIsfarmerDefault < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :is_farmer,:boolean
  end

  def down
    change_column :users, :is_farmer,:boolean, default: false
  end
end

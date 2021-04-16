class AddIsfarmerToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_farmer, :boolean
  end
end

class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.boolean :is_permit, default: false
      t.integer :category, default: 0
      t.integer :status, default: 0
      t.string :title
      t.text :text
      t.text :return_text

      t.timestamps
    end
  end
end

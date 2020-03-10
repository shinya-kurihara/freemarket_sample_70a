class CreateSendingDestinations < ActiveRecord::Migration[5.2]
  def change
    create_table :sending_destinations do |t|
      t.string :post_code,     null: false
      t.string :prefecture,    null: false
      t.string :city,          null: false
      t.string :house_number,  null: false
      t.string :building_name, null: false
      t.integer :phone_number, null: false
      t.references :user,      foreign_key: true
      t.timestamps
    end
  end
end

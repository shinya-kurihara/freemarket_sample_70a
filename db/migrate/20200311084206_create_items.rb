class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name,                null: false
      t.integer :price,              null: false
      t.string :item_description,    null: false
      t.string :category,            null: false
      # t.references :item_condition,  null: false, foreign_key: true
      # t.references :postage_payer,   null: false, foreign_key: true
      # t.references :preparation_day, null: false, foreign_key: true
      t.references :buyer,           null: false, foreign_key: { to_table: :users }
      t.references :seller,          null: false, foreign_key: { to_table: :users }
      # t.references :brand,           foreign_key: true
      t.timestamps
    end
  end
end

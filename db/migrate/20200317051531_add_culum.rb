class AddCulum < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_condition, :integer, null: false, foreign_key: true
    add_column :items, :postage_payer, :integer, null: false, foreign_key: true
    add_column :items, :preparation_day, :integer, null: false, foreign_key: true
    add_column :items, :prefecture, :integer, null: false, foreign_key: true
  end
end
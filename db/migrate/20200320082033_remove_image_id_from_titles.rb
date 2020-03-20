class RemoveImageIdFromTitles < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :item_image_id
  end
end

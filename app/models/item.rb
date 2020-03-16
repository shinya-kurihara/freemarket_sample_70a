class Item < ApplicationRecord
  has_many :item_images

  def first_image
    item_images.first
  end
end

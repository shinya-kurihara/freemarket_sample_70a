class ItemImage < ApplicationRecord
  belongs_to :item, optional: true, foreign_key: :item_image_id, dependent: :destroy
  mount_uploader :image, ImageUploader

  # validates :image, presence: true
end

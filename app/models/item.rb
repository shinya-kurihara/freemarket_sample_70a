class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :item_images
  accepts_nested_attributes_for :item_images, allow_destroy: true
  belongs_to :category
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional:true
  has_many :comments
  # belongs_to :brand, required: true
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User"
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :preparation_day

  def first_image
    item_images.first
  end
end

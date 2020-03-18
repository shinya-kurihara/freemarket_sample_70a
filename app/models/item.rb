class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_many :item_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  # belongs_to :category
  belongs_to :brand, optional: true
  belongs_to :seller, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :preparation_day
  # validates :name,                presence: true, length: { maximum: 40, message: "入力してください" }
  # validetes :item_description,    presence: true, length: { maximum: 1000, message: "入力してください" }
  # validetes :category,            presence: true
  # validates :item_condition,      presence: true
  # validates :postage_payer,       presence: true
  # validates :prefecture,          presence: true
  # validates :preparation_day,     presence: true
  # validetes :price,               presence: true, { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  def first_image
    item_images.first
  end
end

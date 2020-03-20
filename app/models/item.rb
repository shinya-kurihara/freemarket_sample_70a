class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  has_many :item_images, foreign_key: :item_id, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  has_many :comments, dependent: :destroy
  belongs_to :category
  belongs_to :seller, class_name: "User"
  belongs_to :buyer, class_name: "User", optional:true
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :preparation_day
  belongs_to_active_hash :brand, optional: true

  validates :item_images,          presence: true,length: { minimum: 1, maximum: 5}
  # validates_associated :item_images
  validates :name,                   presence: true, length: { maximum: 40 }
  validates :item_description,       presence: true, length: { maximum: 1000 }
  validates :category_id,            presence: true
  validates :item_condition_id,      presence: true
  validates :postage_payer_id,       presence: true
  validates :prefecture_id,          presence: true
  validates :preparation_day_id,     presence: true
  validates :price,                  presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }

  def first_image
    item_images.first
  end
end

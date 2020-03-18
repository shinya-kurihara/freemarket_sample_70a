class Item < ApplicationRecord
  has_many :item_images, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  # belongs_to :category
  belongs_to :brand
  belongs_to :seller, class_name: "User", optional: true
  belongs_to :buyer, class_name: "User", optional: true

  validates :image,               presence: true, { messge: "画像を選択してください" }
  validates :name,                presence: true, length: { maximum: 40, message: "入力してください" }
  validetes :item_description,    presence: true, length: { maximum: 1000, message: "入力してください" }
  validetes :category,            presence: true, { message: "選択してください" }
  validates :item_condition,      presence: true, { message: "選択してください" }
  validates :postage_payer,       presence: true, { message: "選択してください" }
  validates :prefecture,          presence: true, { message: "選択してください" }
  validates :preparation_day,     presence: true, { message: "選択してください" }
  validetes :price,               presence: true, { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "300円~9,999,999円の間で入力してください" }
end

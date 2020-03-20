require 'rails_helper'

describe Item do
  describe '#create' do

    # 1.写真や名前他全ての項目が存在すれば登録できること
    it "is valid with a name, item_description, category, item_condition_id, postage_payer,_id prefecture_id, preparation_day_id, price" do
      item = build(:item)
      expect(item).to be_valid
    end

    # 2.nameが空だと登録できないこと
    it "is invalid without a name" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    # 3.item_descriptionが空だと登録できないこと
    it "is invalid without a item_description" do
      item = build(:item, item_description: nil)
      item.valid?
      expect(item.errors[:item_description]).to include("can't be blank")
    end

    # 4.categoryが空だと登録できないこと
    it "is invalid without a category" do
      item = build(:item, category: nil)
      item.valid?
      expect(item.errors[:category]).to include("can't be blank")
    end

    # 5.item_condition_idが空だと登録できないこと
    it "is invalid without a item_condition_id" do
      item = build(:item, item_condition_id: "")
      item.valid?
      expect(item.errors[:item_condition_id]).to include("can't be blank")
    end

    # 6.postage_payer_idが空だと登録できないこと
    it "is invalid without a postage_payer_id" do
      item = build(:item, postage_payer_id: "")
      item.valid?
      expect(item.errors[:postage_payer_id]).to include("can't be blank")
    end

    # 7.prefecture_idが空だと登録できないこと
    it "is invalid without a prefecture_id" do
      item = build(:item, prefecture_id: nil)
      item.valid?
      expect(item.errors[:prefecture_id]).to include("can't be blank")
    end

    # 8.preparation_day_idが空だと登録できないこと
    it "is invalid without a preparation_day_id" do
      item = build(:item, preparation_day_id: nil)
      item.valid?
      expect(item.errors[:preparation_day_id]).to include("can't be blank")
    end

    # 9.priceが空だと登録できないこと
    it "is invalid without a price" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end
  end
end

describe ItemImage do
  describe '#create' do
    # 9.imageが空だと登録できないこと
    it "is invalid without a image" do
      item_image = build(:item_image, image: nil)
      item_image.valid?
      expect(item_image.errors[:image]).to include("can't be blank")
    end
  end
end
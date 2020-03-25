require 'rails_helper'

describe User do
  describe '#create' do

    # 1. nicknameとemail、password他全ての項目が存在すれば登録できること
    it "is valid with a nickname, email, password, password_confirmation, first_name, last_name, first_kana, last_kana, birth_year, birth_month, birth_day" do
      user = build(:user)
      expect(user).to be_valid
    end

    # 2. nicknameが空だと登録できないこと
    it "is invalid without a nickname" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("が入力されていません。")
    end
    
    # 3. emailが空だと登録できないこと
    it "is invalid without a email" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end

    # 4. emailの@がないと登録できないこと
    it "is invalid without a email of @" do
      user = build(:user, email: "eegmail.com")
      user.valid?
      expect(user.errors[:email]).to include("は有効でありません。")
    end

    # 5. passwordがないと登録できないこと
    it "is invalid without a password" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    # 6. passwordがあってもpassword_confirmationがないと登録できないこと
    it "is invalid without a password_confirmation although with a password" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("が内容とあっていません。")
    end

    # 7. emailが重複した場合、登録できないこと
    it "is invalid with a duplicate email address" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("は既に使用されています。")
    end

    # 8.passwordが7字以上だと登録できること
    it "is valid with a password that has more than 7 characters " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    # 9.passwordが6字以下だと登録できないこと
    it "is invalid with a password that has less than 6 characters " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上に設定して下さい。")
    end

    # 10.first_nameがないと登録できないこと
    it "is invalid without a first_name" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("が入力されていません。")
    end

    # 11.last_nameがないと登録できないこと
    it "is invalid without a last_name" do
      user = build(:user, last_name: "")
      user.valid?
      expect(user.errors[:last_name]).to include("が入力されていません。")
    end

    # 12.first_kanaがないと登録できないこと
    it "is invalid without a first_kana" do
      user = build(:user, first_kana: "")
      user.valid?
      expect(user.errors[:first_kana]).to include("が入力されていません。")
    end
    
    # 13.last_kanaがないと登録できないこと
    it "is invalid without a last_kana" do
      user = build(:user, last_kana: "")
      user.valid?
      expect(user.errors[:last_kana]).to include("が入力されていません。")
    end

    # 14.birth_yearがないと登録できないこと
    it "is invalid without a birth_year" do
      user = build(:user, birth_year: "")
      user.valid?
      expect(user.errors[:birth_year]).to include("が入力されていません。")
    end

    # 15.birth_monthがないと登録できないこと
    it "is invalid without a birth_month" do
      user = build(:user, birth_month: "")
      user.valid?
      expect(user.errors[:birth_month]).to include("が入力されていません。")
    end

    # 16.birth_dayがないと登録できないこと
    it "is invalid without a birth_day" do
      user = build(:user, birth_day: "")
      user.valid?
      expect(user.errors[:birth_day]).to include("が入力されていません。")
    end

  end
  
end

describe SendingDestination do
  describe '#create' do

    # 17.post_code, prefecture, city, house_numberがあれば登録できること
    it "is valid with a post_code, prefecture, city, house_number" do
      sending_destination = build(:sending_destination)
      expect(sending_destination).to be_valid
    end

    # 18.post_codeがないと登録できないこと
    it "is invalid without a post_code" do
      sending_destination = build(:sending_destination, post_code: "")
      sending_destination.valid?
      expect(sending_destination.errors[:post_code]).to include("が入力されていません。")
    end

    # 19.prefectureがないと登録できないこと
    it "is invalid without a prefecture" do
      sending_destination = build(:sending_destination, prefecture: "")
      sending_destination.valid?
      expect(sending_destination.errors[:prefecture]).to include("が入力されていません。")
    end

    # 20.cityがないと登録できないこと
    it "is invalid without a city" do
      sending_destination = build(:sending_destination, city: "")
      sending_destination.valid?
      expect(sending_destination.errors[:city]).to include("が入力されていません。")
    end

    # 21.house_numberがないと登録できないこと
    it "is invalid without a house_number" do
      sending_destination = build(:sending_destination, house_number: "")
      sending_destination.valid?
      expect(sending_destination.errors[:house_number]).to include("が入力されていません。")
    end

  end
end
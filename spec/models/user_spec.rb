require 'rails_helper'

describe User do
  describe '#create' do

    it "全ての項目の入力が存在すれば登録できること" do 
      user = build(:user)
      expect(user).to be_valid
    end

    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid? 
      expect(another_user.errors[:email]).to include("はすでに存在します") 
    end

    it "emailが@とドメインを含んでいない場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: "kkk")
      another_user.valid? 
      expect(another_user.errors[:email]).to include("のフォーマットが不適正です") 
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "passwordが7文字以上であれば登録できること" do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      expect(user).to be_valid
    end

    it "passwordが7文字未満であれば登録できないこと" do
      user = build(:user, password: "000000", password_confirmation: "000000") 
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it "password_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "family_nameがない場合は登録できないこと" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "family_nameが全角入力でなければ登録できないこと" do
      user = build(:user, family_name: "ﾔﾏﾀﾞ")
      user.valid? 
      expect(user.errors[:family_name]).to include("のフォーマットが不適正です") 
    end

    it "first_nameがない場合は登録できないこと" do
      user = build(:user, first_name: "")
      user.valid?
      expect(user.errors[:first_name]).to include("を入力してください")
    end

    it "first_nameが全角入力でなければ登録できないこと" do
      user = build(:user, first_name: "ｱﾔ")
      user.valid? 
      expect(user.errors[:first_name]).to include("のフォーマットが不適正です") 
    end

    it "family_name_kanaがない場合は登録できないこと" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("を入力してください")
    end

    it "family_name_kanaが全角入力でなければ登録できないこと" do
      user = build(:user, family_name_kana: "ﾔﾏﾀﾞ")
      user.valid? 
      expect(user.errors[:family_name_kana]).to include("のフォーマットが不適正です") 
    end

    it "first_name_kanaがない場合は登録できないこと" do
      user = build(:user, first_name_kana: "")
      user.valid?
      expect(user.errors[:first_name_kana]).to include("を入力してください")
    end

    it "first_name_kanaが全角入力でなければ登録できないこと" do
      user = build(:user, first_name_kana: "ｱﾔ")
      user.valid? 
      expect(user.errors[:first_name_kana]).to include("のフォーマットが不適正です") 
    end

    it "birthdayがない場合は登録できないこと" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください")
    end

  end
end
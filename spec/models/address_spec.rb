require 'rails_helper'

describe Address do
  describe '#create' do

    it "全ての項目の入力が存在しても登録できること" do 
      address = build(:address)
      expect(address).to be_valid
    end

    it "building_nameとphone_numberがなくても登録できること" do 
      address = build(:address, building_name: "", phone_number: "")
      expect(address).to be_valid
    end

    it "family_nameがない場合は登録できないこと" do
      address = build(:address, family_name: "")
      address.valid?
      expect(address.errors[:family_name]).to include("を入力してください")
    end

    it "first_nameがない場合は登録できないこと" do
      address = build(:address, first_name: "")
      address.valid?
      expect(address.errors[:first_name]).to include("を入力してください")
    end

    it "family_name_kanaがない場合は登録できないこと" do
      address = build(:address, family_name_kana: "")
      address.valid?
      expect(address.errors[:family_name_kana]).to include("を入力してください")
    end

    it "first_name_kanaがない場合は登録できないこと" do
      address = build(:address, first_name_kana: "")
      address.valid?
      expect(address.errors[:first_name_kana]).to include("を入力してください")
    end

    it "postcodeがない場合は登録できないこと" do
      address = build(:address, postcode: "")
      address.valid?
      expect(address.errors[:postcode]).to include("を入力してください")
    end

    it "prefectureがない場合は登録できないこと" do
      address = build(:address, prefecture: "")
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      address = build(:address, city: "")
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "blockがない場合は登録できないこと" do
      address = build(:address, block: "")
      address.valid?
      expect(address.errors[:block]).to include("を入力してください")
    end

  end
end
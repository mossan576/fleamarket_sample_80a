require 'rails_helper'
describe Item do
  describe '#create' do

    # 1. nameが空では登録できないこと
    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("can't be blank")
    end

    # 2. descriptionが空では登録できないこと
    it "is invalid without a description" do
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("can't be blank")
    end

    # 3. statusが空では登録できないこと
    it "is invalid without a status" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("can't be blank")
    end

    # 4. freightが空では登録できないこと
    it "is invalid without a freight" do
      item = build(:item, freight: "")
      item.valid?
      expect(item.errors[:freight]).to include("can't be blank")
    end

    # 5. shipment_sourceが空では登録できないこと
    it "is invalid without a shipment_source" do
      item = build(:item, shipment_source: "")
      item.valid?
      expect(item.errors[:shipment_source]).to include("can't be blank")
    end

    # 6. ship_dateが空では登録できないこと
    it "is invalid without a ship_date" do
      item = build(:item, ship_date: "")
      item.valid?
      expect(item.errors[:ship_date]).to include("can't be blank")
    end

    # 7. priceが空では登録できないこと
    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("can't be blank")
    end

    # 8. user_idが空では登録できないこと
    it "is invalid without a user_id" do
      item = build(:item, user_id: "")
      item.valid?
      expect(item.errors[:user_id]).to include("can't be blank")
    end

    # 9. category_idが空では登録できないこと
    it "is invalid without a category_id" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("can't be blank")
    end
    
  end
end
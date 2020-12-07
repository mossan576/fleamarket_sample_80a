require 'rails_helper'
describe Item do
  describe '#create' do

    it "is invalid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "is invalid without a description" do
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "is invalid without a status" do
      item = build(:item, status: "")
      item.valid?
      expect(item.errors[:status]).to include("を入力してください")
    end

    it "is invalid without a freight" do
      item = build(:item, freight: "")
      item.valid?
      expect(item.errors[:freight]).to include("を入力してください")
    end

    it "is invalid without a shipment_source" do
      item = build(:item, shipment_source: "")
      item.valid?
      expect(item.errors[:shipment_source]).to include("を入力してください")
    end

    it "is invalid without a ship_date" do
      item = build(:item, ship_date: "")
      item.valid?
      expect(item.errors[:ship_date]).to include("を入力してください")
    end

    it "is invalid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "is invalid without a user_id" do
      item = build(:item, user_id: "")
      item.valid?
      expect(item.errors[:user_id]).to include("を入力してください")
    end

    it "is invalid without a category_id" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

  end
end 
RSpec.describe Item, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

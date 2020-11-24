require 'rails_helper'

describe CreditCard do
  describe '#create' do

    it "card_idがない場合は登録できないこと" do
      credit_card = build(:credit_card, card_id: "")
      credit_card.valid?
      expect(credit_card.errors[:card_id]).to include("を入力してください")
    end

    it "重複したcard_idが存在する場合登録できないこと" do
      credit_card = create(:credit_card)
      another_credit_card = build(:credit_card, card_id: credit_card.card_id)
      another_credit_card.valid? 
      expect(another_credit_card.errors[:card_id]).to include("はすでに存在します") 
    end

    it "customer_idがない場合は登録できないこと" do
      credit_card = build(:credit_card, customer_id: "")
      credit_card.valid?
      expect(credit_card.errors[:customer_id]).to include("を入力してください")
    end

    it "重複したcustomer_idが存在する場合登録できないこと" do
      credit_card = create(:credit_card)
      another_credit_card = build(:credit_card, customer_id: credit_card.customer_id)
      another_credit_card.valid? 
      expect(another_credit_card.errors[:customer_id]).to include("はすでに存在します") 
    end

  end
end

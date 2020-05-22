require 'rails_helper'
describe CreditCard do
  describe '#create' 
    it "user_idがない場合は登録できないこと" do
      credit_card = build(:credit_card, user_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:user_id]).to include("を入力してください")
    end
    it "customer_idがない場合は登録できないこと" do
      credit_card = build(:credit_card, customer_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:customer_id]).to include("を入力してください")
    end
    it "card_idがない場合は登録できないこと" do
      credit_card = build(:credit_card, card_id: nil)
      credit_card.valid?
      expect(credit_card.errors[:card_id]).to include("を入力してください")      
    end
  end
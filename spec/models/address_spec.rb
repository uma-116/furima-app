require 'rails_helper'
describe Address do
  describe '#create_address' do
    it "firstnameがない場合は登録できないこと" do
      address = build(:address, firstname: nil)
      address.valid?
      expect(address.errors[:firstname]).to include("を入力してください")
    end

    it "lastnameがない場合は登録できないこと" do
      address = build(:address, lastname: nil)
      address.valid?
      expect(address.errors[:lastname]).to include("を入力してください")
    end

    it "firstname_kanaがない場合は登録できないこと" do
      address = build(:address, firstname_kana: nil)
      address.valid?
      expect(address.errors[:firstname_kana]).to include("を入力してください")
    end

    it "lastname_kanaがない場合は登録できないこと" do
      address = build(:address, lastname_kana: nil)
      address.valid?
      expect(address.errors[:lastname_kana]).to include("を入力してください")
    end

    it "postal_codeがない場合は登録できないこと" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it "prefectureがない場合は登録できないこと" do
      address = build(:address, prefecture: nil)
      address.valid?
      expect(address.errors[:prefecture]).to include("を入力してください")
    end

    it "cityがない場合は登録できないこと" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "addressがない場合は登録できないこと" do
      address = build(:address, address: nil)
      address.valid?
      expect(address.errors[:address]).to include("を入力してください")
    end

  end
end
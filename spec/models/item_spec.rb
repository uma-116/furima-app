require 'rails_helper'
RSpec.describe Item, type: :model do
  describe Item do
    describe '#create' do

      it " name,detail,condition,category_id,price,postage,ship_from,ship_date,seller,category_id,imagesに値があれば登録できること " do
        user = create(:user)
        category = create(:category)
        # image = File.open("#{Rails.root}/spec/fixtures/fire_up.png")
        image = File.open("#{Rails.root}/public/images/fire_up.png")
        item = build(:item, category_id: category.id, seller_id: user.id, images_attributes: [img: image])
        item.valid?
        expect(item).to be_valid
      end

      it "sellerがない場合は登録できないこと" do
        item = build(:item, seller_id: nil)
        item.valid?
        expect(item.errors[:seller]).to include("を入力してください")

      end

      it "imagesがない場合は登録できないこと" do
        expect(build(:item, images: [])).not_to be_valid
        # accepts_neseted_attributes_for を使った場合、以下のように書かないとエラーになります
        # 上の構文は、詳しく省略しないと下の３行になります
        # item = build(:item, img: [])
        # item.valid?
        # expect(item.errors[:img]).to include("を入力してください")
      end

      it "category_idがない場合は登録できないこと" do
        item = build(:item, category_id: nil)
        item.valid?
        expect(item.errors[:category_id]).to include("を入力してください")
      end

      it "nameがない場合は登録できないこと" do
        item = build(:item, name: nil)
        item.valid?
        expect(item.errors[:name]).to include("を入力してください")
      end

      it "detailがない場合は登録できないこと" do
        item = build(:item, detail: nil)
        item.valid?
        expect(item.errors[:detail]).to include("を入力してください")
      end

      it "conditionがない場合は登録できないこと" do
        item = build(:item, condition: nil)
        item.valid?
        expect(item.errors[:condition]).to include("を入力してください")
      end

      it "category_idがない場合は登録できないこと" do
        item = build(:item, category_id: nil)
        item.valid?
        expect(item.errors[:category_id]).to include("を入力してください")
      end

      it "priceがない場合は登録できないこと" do
        item = build(:item, price: nil)
        item.valid?
        expect(item.errors[:price]).to include("を入力してください")
      end

      it "postageがない場合は登録できないこと" do
        item = build(:item, postage: nil)
        item.valid?
        expect(item.errors[:postage]).to include("を入力してください")
      end

      it "ship_fromがない場合は登録できないこと" do
        item = build(:item, ship_from: nil)
        item.valid?
        expect(item.errors[:ship_from]).to include("を入力してください")
      end

      it "ship_dateがない場合は登録できないこと" do
        item = build(:item, ship_date: nil)
        item.valid?
        expect(item.errors[:ship_date]).to include("を入力してください")
      end
    end
  end
end

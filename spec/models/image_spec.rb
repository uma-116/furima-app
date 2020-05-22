require 'rails_helper'
describe Image do
 it "imgがない場合は登録できないこと" do
   image = build(:image, img: nil)
   image.valid?
   expect(image.errors[:img]).to include("を入力してください")
 end
end

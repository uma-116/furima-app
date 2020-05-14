require 'rails_helper'
describe User do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "password_confirmationがない場合は登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "firstnameがない場合は登録できないこと" do
      user = build(:user, firstname: nil)
      user.valid?
      expect(user.errors[:firstname]).to include("を入力してください")
    end

    it "lastnameがない場合は登録できないこと" do
      user = build(:user, lastname: nil)
      user.valid?
      expect(user.errors[:lastname]).to include("を入力してください")
    end

    it "firstname_kanaがない場合は登録できないこと" do
      user = build(:user, firstname_kana: nil)
      user.valid?
      expect(user.errors[:firstname_kana]).to include("を入力してください")
    end

    it "lastname_kanaがない場合は登録できないこと" do
      user = build(:user, lastname_kana: nil)
      user.valid?
      expect(user.errors[:lastname_kana]).to include("を入力してください")
    end

    it "birth_yearがない場合は登録できないこと" do
      user = build(:user, birth_year: nil)
      user.valid?
      expect(user.errors[:birth_year]).to include("を入力してください")
    end

    it "birth_monthがない場合は登録できないこと" do
      user = build(:user, birth_month: nil)
      user.valid?
      expect(user.errors[:birth_month]).to include("を入力してください")
    end

    it "birth_dayがない場合は登録できないこと" do
      user = build(:user, birth_day: nil)
      user.valid?
      expect(user.errors[:birth_day]).to include("を入力してください")
    end

    it "phone_numberがない場合は登録できないこと" do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("を入力してください")
    end

    it " 重複したemailが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it " 重複したphone_numberが存在する場合は登録できないこと " do
      user = create(:user)
      another_user = build(:user, phone_number: user.phone_number)
      another_user.valid?
      expect(another_user.errors[:phone_number]).to include("はすでに存在します")
    end

    it " passwordが7文字以上であれば登録できること " do
      user = build(:user, password: "0000000", password_confirmation: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it " passwordが6文字以下であれば登録できないこと " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end

    it " firstnameが文字列であれば登録できること " do
      user = build(:user, firstname: "山田")
      user.valid?
      expect(user).to be_valid
    end

    it " firstnameが文字列でなければ登録できないこと " do
      user = build(:user, firstname: "111")
      user.valid?
      expect(user.errors[:firstname]).to include("は不正な値です")
    end

    it " lastnameが文字列であれば登録できること " do
      user = build(:user, lastname: "ひろし")
      user.valid?
      expect(user).to be_valid
    end

    it " lastnameが文字列でなければ登録できないこと " do
      user = build(:user, lastname: "111")
      user.valid?
      expect(user.errors[:lastname]).to include("は不正な値です")
    end

    it " firstname_kanaがカタカナであれば登録できること " do
      user = build(:user, firstname: "ヤマダ")
      user.valid?
      expect(user).to be_valid
    end

    it " firstname_kanaがカタカナでなければ登録できないこと " do
      user = build(:user, firstname_kana: "山田")
      user.valid?
      expect(user.errors[:firstname_kana]).to include("は不正な値です")
    end

    it " lastname_kanaがカタカナであれば登録できること " do
      user = build(:user, lastname_kana: "ヒロシ")
      user.valid?
      expect(user).to be_valid
    end

    it " lastname_kanaがカタカナでなければ登録できないこと " do
      user = build(:user, lastname_kana: "ひろし")
      user.valid?
      expect(user.errors[:lastname_kana]).to include("は不正な値です")
    end

    it " birth_yearが数字４ケタであれば登録できること " do
      user = build(:user, birth_year: "1990")
      user.valid?
      expect(user).to be_valid
    end

    it " birth_yearが数字４ケタでなければ登録できないこと " do
      user = build(:user, birth_year: "199")
      user.valid?
      expect(user.errors[:birth_year]).to include("は不正な値です")
    end

    it " birth_monthが1から12の数字であれば登録できること " do
      user = build(:user, birth_month: "10")
      user.valid?
      expect(user).to be_valid
    end

    it " birth_monthが1から12の数字でなければ登録できないこと " do
      user = build(:user, birth_month: "100")
      user.valid?
      expect(user.errors[:birth_month]).to include("は13より小さい値にしてください")
    end

    it " birth_dayが1から31の数字であれば登録できること " do
      user = build(:user, birth_day: "10")
      user.valid?
      expect(user).to be_valid
    end

    it " birth_dayが1から31の数字でなければ登録できないこと " do
      user = build(:user, birth_day: "100")
      user.valid?
      expect(user.errors[:birth_day]).to include("は32より小さい値にしてください")
    end

  end
end
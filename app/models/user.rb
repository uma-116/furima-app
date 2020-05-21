class User < ApplicationRecord
  has_one :profile , dependent: :destroy
  has_one :address , dependent: :destroy
  has_one :credit_card , dependent: :destroy
  has_many :items

  # 販売中 → 自分のseller_idが入っていて、buyer_idが入っていないitem
  has_many :selling_items,  -> { where("buyer_id is NULL") }, class_name: "item", foreign_key: "seller_id"
  # 買った商品 → 自分のbuyer_idが入っているitem
  has_many :bought_items, class_name: "item", foreign_key: "buyer_id"  
  # 売却済み商品 → 自分のseller_id が入っていて、buyer_idが入ってるitem
  has_many :sold_items,  -> { where("buyer_id is not NULL") }, class_name: "item", foreign_key: "seller_id"

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname , :lastname, :firstname_kana, :lastname_kana, :nickname, :email, :birth_year, :birth_month, :birth_day, :phone_number, presence: true
  validates :phone_number, uniqueness: true

  validates :firstname     , format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :lastname      , format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :firstname_kana, format: {with: /\A[ァ-ンー－]+\z/}
  validates :lastname_kana , format: {with: /\A[ァ-ンー－]+\z/}
  validates :birth_year    , format: {with: /\A\d{4}\z/}
  validates :birth_month   , numericality: { only_integer: true , greater_than: 0, less_than: 13 }
  validates :birth_day     , numericality: { only_integer: true , greater_than: 0, less_than: 32 }
  validates :phone_number    , numericality: { only_integer: true }, length: { in: 10..11 }

end

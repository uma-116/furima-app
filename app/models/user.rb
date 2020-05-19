class User < ApplicationRecord
  has_one :profile , dependent: :destroy
  has_one :address , dependent: :destroy
  has_one :credit_card , dependent: :destroy
  has_many :items
  has_many :comments

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

class User < ApplicationRecord
  has_one :profile , dependent: :destroy
  has_one :address , dependent: :destroy
  has_one :credit_card , dependent: :destroy
  has_many :items

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :firstname , :lastname, :firstname_kana, :lastname_kana, :nickname, :birth_year, :birth_month, :birth_day, :phone_number, presence: true


end

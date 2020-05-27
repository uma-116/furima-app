class Address < ApplicationRecord
  belongs_to :user, optional: true

  validates :postal_code , :prefecture , :city , :address, :firstname, :lastname, :firstname_kana, :lastname_kana, presence: true

  validates :firstname     , format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :lastname      , format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :firstname_kana, format: {with: /\A[ァ-ンー－]+\z/}
  validates :lastname_kana , format: {with: /\A[ァ-ンー－]+\z/}
  validates :prefecture    , format: {with: /\A[ぁ-んァ-ン一-龥]/}

end

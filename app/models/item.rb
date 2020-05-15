class Item < ApplicationRecord
  belongs_to :user
  has_many :image
  belongs_to :category
end

class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :stats
  belongs_to_active_hash :shipping
  belongs_to_active_hash :fee

  has_many :images

  belongs_to :user
  belongs_to :category
  has_many :comments

  accepts_nested_attributes_for :images, allow_destroy: true

  validates_associated :images
  validates :images, presence: true

  validates :name, :detail, :condition, :category_id, :price, :postage, :ship_from, :ship_date, presence: true

end

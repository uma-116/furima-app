class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :status
  belongs_to_active_hash :shipping
  belongs_to_active_hash :fee

  has_many :images

  belongs_to :category
  has_many :comments
  
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true

  accepts_nested_attributes_for :images, allow_destroy: true

  validates_associated :images
  validates :images, presence: true

  validates :name, :detail, :condition, :category_id, :price, :postage, :ship_from, :ship_date, presence: true

  def self.search(search)
    if search
      Item.where('name LIKE(?) or detail LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Item.all
    end
  end
end

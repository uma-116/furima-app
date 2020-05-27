class Item < ApplicationRecord
  # active_hash association
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :fee
  belongs_to_active_hash :shipping
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture

  # items table association
  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true, reject_if: :no_image

  def no_image(attributes)
    attributes[:img].blank?
  end


  has_many :comments, dependent: :destroy

  belongs_to :category
  belongs_to :seller, class_name: "User", foreign_key: "seller_id"
  belongs_to :buyer, class_name: "User", foreign_key: "buyer_id", optional: true



  validates :images, presence: true

  validates :name, :detail, :condition_id, :category_id, :price, :fee_id, :prefecture_id, :shipping_id, presence: true

  def self.search(search)
    if search
      Item.where('name LIKE(?) or detail LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Item.all
    end
  end
end

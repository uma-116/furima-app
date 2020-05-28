class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :comment, :user_id, :item_id, presence: true
end
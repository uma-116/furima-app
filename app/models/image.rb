class Image < ApplicationRecord
  mount_uploader :img, ImageUploader
  belongs_to :item
end

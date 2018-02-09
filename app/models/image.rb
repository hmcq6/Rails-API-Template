class Image < ApplicationRecord
  mount_uploader :file_name, ImageUploader
  belongs_to :item, optional: true
  belongs_to :brand, optional: true
end

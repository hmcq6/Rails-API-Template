class Item < ApplicationRecord
  has_many :images
  has_one :brand
end

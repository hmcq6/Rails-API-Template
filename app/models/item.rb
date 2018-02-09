class Item < ApplicationRecord
  has_many :images
  has_and_belongs_to_many :features
  belongs_to :brand
  belongs_to :type
end

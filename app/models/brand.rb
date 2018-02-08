class Brand < ApplicationRecord
  belongs_to :image
  has_many :items
end

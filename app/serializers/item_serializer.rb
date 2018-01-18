class ItemSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :name, :alt_name, :year, :product_number, :bust, :length, :bust, :price, :waist, :notes
end

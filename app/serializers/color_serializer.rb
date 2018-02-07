class ColorSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :name, :hex
end

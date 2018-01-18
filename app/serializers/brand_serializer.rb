class BrandSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :name, :nickname
end

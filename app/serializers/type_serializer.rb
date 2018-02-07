class TypeSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :name
end

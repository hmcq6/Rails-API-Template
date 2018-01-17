class ImageSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :url, :description

  attribute :url do
    object.file_name.url
  end
end

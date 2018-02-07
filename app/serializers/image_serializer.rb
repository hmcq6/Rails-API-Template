class ImageSerializer < ActiveModel::Serializer
  include JSONAPI::Serializer
  attributes :id, :url, :name, :description

  attribute :url do
    object.file_name.url
  end

  attribute :name do
    object.file_name.file.filename
  end
end

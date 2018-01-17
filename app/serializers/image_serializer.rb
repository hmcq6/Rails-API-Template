class ImageSerializer < ActiveModel::Serializer
  attributes :id, :type, :url, :description

  def type
    'image'
  end

  def url
    self.object.file_name.url
  end
end

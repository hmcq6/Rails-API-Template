class ImageSerializer < ActiveModel::Serializer
  attributes :id, :description

  def name
    self.file_name.url
  end
end

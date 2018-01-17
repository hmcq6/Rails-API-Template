class ImageController < ApplicationController
  include ActionController::Serialization
  respond_to :json

  def index
    json = Image.all
    render json: json, root: 'data' #ActiveModel::ArraySerializer.new(json, each_serializer: ImagesSerializer, root: 'image').to_json
  end

  def create
    @image = Image.new(file_name: params[:file])
    if @image.save!
      render json: @image
    end
  end
end

class ImageController < ApplicationController
  respond_to :json

  def index
    json = Image.all
    render json: JSONAPI::Serializer.serialize(Image.all, { is_collection: true })
  end

  def create
    @image = Image.new(file_name: params[:file])
    if @image.save!
      render json: @image
    end
  end
end

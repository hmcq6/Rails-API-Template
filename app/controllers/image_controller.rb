class ImageController < ApplicationController
  respond_to :json
  skip_before_action :authenticate_user_from_token!, only: [:index, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    render json: JSONAPI::Serializer.serialize(Image.all, { is_collection: true })
  end

  def show
    render json: JSONAPI::Serializer.serialize(Image.find(params[:id]))
  end

  def create
    @image = Image.new(file_name: params[:file])
    if @image.save!
      render json: @image
    end
  end
end

class ImageController < ApplicationController
  respond_to :json
  def create
    @image = Image.new(file_name: params[:file])
    if @image.save!
      render json: @image
    end
  end
end

class ItemsController < ApplicationController
  respond_to :json
  skip_before_action :authenticate_user_from_token!, only: [:index, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    render json: JSONAPI::Serializer.serialize(Item.all, { is_collection: true })
  end

  def show
    render json: JSONAPI::Serializer.serialize(Item.find(params.require(:id)))
  end

  def create
    create_params = required_params
    # create_params = create_params.merge(image_id: permitted_params[:id]) unless permitted_params[:id].nil?
    item = Item.new(create_params)
    if item.save!
      render json: JSONAPI::Serializer.serialize(item)
    end
  end

  def image
    # render json: JSONAPI::Serializer.serialize(Item.find(params.require(:id)).image)
  end

  def required_params
    params.require(:data)
          .require(:attributes)
          .permit(:name, :alt_name, :year, :product_number, :length, :price, :waist, :notes)
  end

  def permitted_params
    # params.require(:data).require(:relationships).require(:image).require(:data).permit(:id)
  end
end

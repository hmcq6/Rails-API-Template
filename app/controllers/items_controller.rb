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
    create_params = create_params.merge(brand_params) unless brand_params[:brand_id].nil?
    #create_params = create_params.merge(type_params) unless type_params[:type_id].nil?
    #create_params = create_params.merge(colors_params) unless colors_params[:color_ids].nil?
    create_params = create_params.merge(images_params) unless images_params[:image_ids].nil?
    byebug
    item = Item.new(create_params)
    if item.save!
      render json: JSONAPI::Serializer.serialize(item)
    end
  end

  def brand
    render json: JSONAPI::Serializer.serialize(Item.find(params.require(:id)).brand)
  end

  def type
    render json: JSONAPI::Serializer.serialize(Item.find(params.require(:id)).type)
  end

  def images
    render json: JSONAPI::Serializer.serialize(Item.find(params.require(:id)).images, is_collection: true)
  end

  def required_params
    params.require(:data)
          .require(:attributes)
          .permit(:name, :alt_name, :year, :product_number, :length, :price, :waist, :notes)
  end

  def brand_params
    {
      brand_id: params.require(:data)
            .require(:relationships)
            .require(:brand)
            .require(:data)
            .permit(:id)[:id]
    }
  end

  def type_params
    {
      type_id: params.require(:data)
                     .require(:relationships)
                     .require(:type)
                     .require(:data)
                     .permit(:id)[:id]
    }
  end

  def colors_params
    {
      color_ids: params.require(:data)
                       .require(:relationships)
                       .require(:colors)
                       .permit(:data).map { |color| color.permit(:id).values.first }
    }
  end

  def images_params
    {
      image_ids: params.require(:data)
                       .require(:relationships)
                       .require(:images)
                       .require(:data).map { |image| image.permit(:id).values.first }
    }
  end

end

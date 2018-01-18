class BrandController < ApplicationController
  respond_to :json
  skip_before_action :authenticate_user_from_token!, only: [:index, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    render json: JSONAPI::Serializer.serialize(Brand.all, { is_collection: true })
  end

  def show
    render json: JSONAPI::Serializer.serialize(Brand.find(params.require(:id)))
  end

  def create
    brand = Brand.new(permitted_params)
    if brand.save!
      render json: JSONAPI::Serializer.serialize(brand)
    end
  end

  def permitted_params
    params.require(:data)
          .require(:attributes)
          .permit(:name, :nickname)
  end
end

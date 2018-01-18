class FeaturesController < ApplicationController
  respond_to :json
  skip_before_action :authenticate_user_from_token!, only: [:index, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    render json: JSONAPI::Serializer.serialize(Feature.all, { is_collection: true })
  end

  def show
    render json: JSONAPI::Serializer.serialize(Feature.find(params.require(:id)))
  end

  def create
    feature = Feature.new(required_params)
    if feature.save!
      render json: JSONAPI::Serializer.serialize(feature)
    end
  end

  def required_params
    params.require(:data)
          .require(:attributes)
          .permit(:name)
  end
end

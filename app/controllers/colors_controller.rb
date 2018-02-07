class ColorsController < ApplicationController
  respond_to :json
  skip_before_action :authenticate_user_from_token!, only: [:index, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    render json: JSONAPI::Serializer.serialize(Color.all, { is_collection: true })
  end

  def show
    render json: JSONAPI::Serializer.serialize(Color.find(params.require(:id)))
  end

  def create
    color = Color.new(required_params)
    if color.save!
      render json: JSONAPI::Serializer.serialize(color)
    end
  end

  def required_params
    params.require(:data)
          .require(:attributes)
          .permit(:name, :hex)
  end
end

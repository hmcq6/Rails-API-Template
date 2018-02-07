class TypeController < ApplicationController
  respond_to :json
  skip_before_action :authenticate_user_from_token!, only: [:index, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    render json: JSONAPI::Serializer.serialize(Type.all, { is_collection: true })
  end

  def show
    render json: JSONAPI::Serializer.serialize(Type.find(params.require(:id)))
  end

  def create
    type = Type.new(required_params)
    if type.save!
      render json: JSONAPI::Serializer.serialize(type)
    end
  end

  def required_params
    params.require(:data)
          .require(:attributes)
          .permit(:name)
  end
end

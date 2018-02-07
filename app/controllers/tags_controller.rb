class TagsController < ApplicationController
  respond_to :json
  skip_before_action :authenticate_user_from_token!, only: [:index, :show]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    render json: JSONAPI::Serializer.serialize(Tag.all, { is_collection: true })
  end

  def show
    render json: JSONAPI::Serializer.serialize(Tag.find(params.require(:id)))
  end

  def create
    tag = Tag.new(required_params)
    if tag.save!
      render json: JSONAPI::Serializer.serialize(tag)
    end
  end

  def required_params
    params.require(:data)
          .require(:attributes)
          .permit(:name)
  end
end

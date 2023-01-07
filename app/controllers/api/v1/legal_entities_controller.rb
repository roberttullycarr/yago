class Api::V1::LegalEntitiesController < ApplicationController
  before_action :authenticate_request!

  def index
    resources = LegalEntity.includes(:quotes).where(user_id: params[:user_id])

    serializer = Api::V1::LegalEntityLiteSerializer.new(resources, { is_collection: true, include: [:quotes] }).serializable_hash.to_json

    render(json: serializer)
  end
end

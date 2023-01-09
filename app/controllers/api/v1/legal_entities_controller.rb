class Api::V1::LegalEntitiesController < ApplicationController
  before_action :authenticate_request!, only: %i[index show]

  def index
    resources = LegalEntity.includes(:quotes).where(user_id: resource_params[:user_id])

    serializer = Api::V1::LegalEntityLiteSerializer.new(resources, { is_collection: true }).serializable_hash.to_json

    render(json: serializer)
  end

  def show
    resource = LegalEntity.find(params[:id])

    serializer = Api::V1::LegalEntitySerializer.new(resource, { is_collection: false }).serializable_hash.to_json

    render(json: serializer)
  end

  def create
    resource = LegalEntity.create!(**resource_params.except(:id))

    if resource.errors.any?
      render(
        json: ErrorSerializer.serialize(resource.errors),
        status: :unprocessable_entity,
        adapter: :json_api
      )
    else
      serializer = Api::V1::LegalEntitySerializer.new(resource, { is_collection: false }).serializable_hash.to_json

      render(json: serializer)
    end
  end

  private

  def resource_params
    params.permit(
        :id,
        :annual_revenue,
        :enterprise_number,
        :legal_name,
        :natural_person,
        :user_id
    )
  end
end

class Api::V1::EntityCodesController < ApplicationController
  def create
    resource = EntityCode.create!(**resource_params)

    if resource.errors.any?
      render(
        json: ErrorSerializer.serialize(resource.errors),
        status: :unprocessable_entity,
        adapter: :json_api
      )
    else
      serializer = Api::V1::EntityCodeSerializer.new(resource, { is_collection: false }).serializable_hash.to_json

      render(json: serializer)
    end
  end

  private

  def resource_params
    params.permit(
      :legal_entity_id,
      :nacebel_code_id
    )
  end
end

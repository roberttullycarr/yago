class Api::V1::EntityCodeController < ApplicationController
  def create
    resource = EntityCode.create!(**resource_params)

    serializer = Api::V1::EntityCodeSerializer.new(resource, { is_collection: true, include: [:quotes] }).serializable_hash.to_json

    render(json: serializer)
  end

  private

  def resource_params
    params.permit(
      :legal_entity_id,
      :nacebel_code_id
    )
  end
end

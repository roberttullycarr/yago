class Api::V1::NacebelCodesController < ApplicationController
  def index
    resources = NacebelCode.all

    serializer = Api::V1::NacebelCodeSerializer.new(resources, { is_collection: true }).serializable_hash.to_json

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

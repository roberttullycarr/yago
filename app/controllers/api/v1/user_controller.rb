class Api::V1::UserController < ApplicationController
  before_action :authenticate_request!, only: %i[show update]

  def create
    resource = User.create(**resource_params)

    resource.send_magic_link

    serializer = Api::V1::UserSerializer.new(resource, { is_collection: false }).serializable_hash.to_json

    render(json: serializer)
  end

  def show
    resource = User.find(params[:id])

    serializer = Api::V1::UserSerializer.new(resource, { is_collection: false }).serializable_hash.to_json

    render(json: serializer)
  end

  def update
    resource = User.update!(**resource_params)

    serializer = Api::V1::UserSerializer.new(resource, { is_collection: false }).serializable_hash.to_json

    render(json: serializer)
  end

  private

  def resource_params
    params.permit(
        :id,
        :email,
        :first_name,
        :last_name,
        :phone_number,
        :address_one,
        :address_two,
        :address_city,
        :address_country,
        :post_code
    )
  end
end

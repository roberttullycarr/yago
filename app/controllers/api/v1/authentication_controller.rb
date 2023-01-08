class Api::V1::AuthenticationController < ApplicationController
  def create
    # if a user exists in the db, find then by their email, and then send them a magic link
    user = User.find_by(email: resource_params[:email])

    if user
      user.send_magic_link
      head :ok
    else
      render status: :bad_request
    end
  end

  private

  def resource_params
    params.permit(
      :email
    )
  end
end

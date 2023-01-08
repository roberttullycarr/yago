require 'json'

class Api::V1::QuotesController < ApplicationController
  # before_action :authenticate_request!

  def create
    external_quote = InsuranceApi.get_quote(resource_params[:legal_entity_id])

    resource = create_quote(resource_params[:legal_entity_id], external_quote['data'])

    if resource.errors.any?
      render(
        json: ErrorSerializer.serialize(resource.errors),
        status: :unprocessable_entity,
        adapter: :json_api
      )
    else
      serializer = Api::V1::QuoteSerializer.new(resource, { is_collection: false }).serializable_hash.to_json

      render(json: serializer)
    end
  end

  def get_and_save_quote
    external_quote = get_external_quote(params[:legal_entity_id])
  end

  private

  def resource_params
    params.permit(
      :legal_entity_id
    )
  end

  def create_quote(legal_entity_id, quote_params)
    Quote.create(
      available: quote_params['available'],
      coverage_ceiling: quote_params['coverage_ceiling'],
      deductible: quote_params['deductible'],
      quote_id: quote_params['quoteId'],
      after_delivery_premium: quote_params['grossPremiums']['afterDelivery'],
      public_liability_premium: quote_params['grossPremiums']['publicLiability'],
      professional_indemity_premium: quote_params['grossPremiums']['professionalIndemnity'],
      entrusted_objects_premium: quote_params['grossPremiums']['entrustedObjects'],
      legal_expenses_premium: quote_params['grossPremiums']['legalExpenses'],
      legal_entity_id: legal_entity_id
    )
  end
end



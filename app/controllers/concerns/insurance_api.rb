module InsuranceApi
  extend ActiveSupport::Concern

  def self.get_quote(legal_entity_id)
    entity = LegalEntity.find(legal_entity_id)

    nacebel_codes = entity.entity_codes.map { |c| c.nacebel_code.code.to_s }

    body = {
      "annualRevenue": entity[:annual_revenue],
      "enterpriseNumber": entity[:enterprise_number],
      "legalName": entity[:legal_name],
      "naturalPerson": entity[:natural_person],
      "nacebelCodes": nacebel_codes
    }.to_json

    @response = RestClient::Request.execute(
      method: :post,
      url: 'https://staging-gtw.seraphin.be/quotes/professional-liability',
      payload: body,
      headers: { "X-Api-Key": insurance_api_key }
    )

    JSON.parse(@response)
  end

  def self.insurance_api_key
    Rails.application.credentials.dig(Rails.env.to_sym, :insurance_api, :api_key)
  end
end

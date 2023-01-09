class Api::V1::QuoteSerializer < Api::V1::BaseSerializer

  attributes(
    :id,
    :available,
    :coverage_ceiling,
    :deductible,
    :quote_id,
    :after_delivery_premium,
    :public_liability_premium,
    :professional_indemity_premium,
    :entrusted_objects_premium,
    :legal_expenses_premium,
    :legal_entity_id,
    :coverage_ceiling_formula,
    :deductible_formula
  )
end

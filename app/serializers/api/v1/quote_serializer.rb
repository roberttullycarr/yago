class Api::V1::QuoteSerializer < Api::V1::BaseSerializer

  attributes(
    :available,
    :coverage_ceiling
  )
end

class Api::V1::LegalEntitySerializer < Api::V1::BaseSerializer
  attributes(
    :id,
    :user_id,
    :annual_revenue,
    :legal_name,
    :natural_person
  )

  has_many :quotes
end

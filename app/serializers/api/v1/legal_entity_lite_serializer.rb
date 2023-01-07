class Api::V1::LegalEntityLiteSerializer < Api::V1::BaseSerializer
  attributes(
    :id,
    :user_id,
    :legal_name,
    :natural_person,
    :enterprise_number
  )

  has_many :quotes
end

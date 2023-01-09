class Api::V1::NacebelCodeSerializer < Api::V1::BaseSerializer
  attributes(
    :id,
    :code,
    :label
  )
end

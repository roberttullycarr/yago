class Api::V1::BaseSerializer
  include JSONAPI::Serializer
  
  set_key_transform :camel_lower
end

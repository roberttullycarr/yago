class EntityProfileCode < ApplicationRecord
  belongs_to :entity_profile
  belongs_to :nacebel_code
end

class EntityCode < ApplicationRecord
  belongs_to :legal_entity
  belongs_to :nacebel_code
end

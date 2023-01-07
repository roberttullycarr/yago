class Quote < ApplicationRecord
  has_many :nacebel_codes
  belongs_to :legal_entity
  has_one :user, through: :legal_entity
end
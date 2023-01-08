class Quote < ApplicationRecord
  has_many :nacebel_codes
  belongs_to :legal_entity
  has_one :user, through: :legal_entity

  validates :legal_entity_id, presence: true, uniqueness: true
  validates :quote_id, presence: true, uniqueness: true
end

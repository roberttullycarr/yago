class LegalEntity < ApplicationRecord
  belongs_to :user
  has_many :quotes
  has_many :entity_codes, dependent: :destroy

  # validates :legal_name, presence: true
  # validates :annual_revenue, presense: true, null: true
  # validates :enterprise_number, uniqueness: true, presence: true
end

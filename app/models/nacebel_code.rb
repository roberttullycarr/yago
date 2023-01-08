class NacebelCode < ApplicationRecord
  validates :code, uniqueness: true
end

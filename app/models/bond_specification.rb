class BondSpecification < ApplicationRecord
  belongs_to :bond,
             inverse_of: :specification
  validates :bond,
            presence: true
end
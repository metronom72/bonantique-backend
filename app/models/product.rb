class Product < ApplicationRecord
  validates :title,
            presence: true
  validates :description,
            presence: true
  validates :available,
            presence: true
end

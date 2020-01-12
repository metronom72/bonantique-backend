class Product < ApplicationRecord
  validates :title,
            :description,
            :available,
            :prices,
            :amount,
            :product_type,
            :quality,
            presence: true

  has_and_belongs_to_many :categories, join_table: 'products_categories'

  default_scope { where(available: true) }
end

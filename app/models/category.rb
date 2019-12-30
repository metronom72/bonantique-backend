class Category < ApplicationRecord
  validates :title, :active, :slug,
            presence: true
  validates :slug,
            uniqueness: true

  has_and_belongs_to_many :products,
                          join_table: 'products_categories'

  belongs_to :parent_category,
             class_name: 'Category',
             optional: true
  has_many :child_categories,
           class_name: 'Category',
           foreign_key: :parent_category_id

  default_scope { where(active: true) }
end

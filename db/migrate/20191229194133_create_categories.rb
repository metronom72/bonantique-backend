class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.string :slug, null: false, uniq: true, index: true
      t.integer :parent_category_id
      t.boolean :active, default: true, null: false

      t.timestamps
    end

    create_table :products_categories do |t|
      t.belongs_to :product, index: true, null: false
      t.belongs_to :category, index: true, null: false
    end
  end
end

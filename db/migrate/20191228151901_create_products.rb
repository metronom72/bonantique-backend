class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.decimal :prices, precision: 1000, scale: 2, array: true, default: [], null: false
      t.date :valid_till
      t.boolean :available, null: false, default: true
      t.integer :amount, null: false, default: 1
      t.string :product_type, null: false

      t.timestamps
    end
  end
end

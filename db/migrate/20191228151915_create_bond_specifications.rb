class CreateBondSpecifications < ActiveRecord::Migration[6.0]
  def change
    create_table :bond_specifications do |t|
      t.integer :bond_id, null: false, index: true, unique: true, foreign_key: true
      t.string :bond_currency, null: false
      t.string :bond_value, null: false
      t.string :bond_serial
      t.string :bond_number
      t.string :bond_country, array: true, default: [], null: false
      t.boolean :is_copy, null: false, default: false

      t.timestamps
    end
  end
end

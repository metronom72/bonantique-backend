class CreateBondSpecifications < ActiveRecord::Migration[6.0]
  def change
    create_table :bond_specifications do |t|
      t.integer :bond_id, null: false, index: true, unique: true, foreign_key: true

      t.string :currency, null: false
      t.string :amount, null: false
      t.string :bond_serial
      t.string :bond_number

      t.timestamps
    end
  end
end

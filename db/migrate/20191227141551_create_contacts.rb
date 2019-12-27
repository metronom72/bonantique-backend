class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :value, null: false
      t.string :label, null: false
      t.string :link
      t.string :scope, null: false, index: true

      t.boolean :active, null: false, default: true

      t.timestamps
    end
  end
end

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_12_29_194133) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bond_specifications", force: :cascade do |t|
    t.integer "bond_id", null: false
    t.string "currency", null: false
    t.string "amount", null: false
    t.string "bond_serial"
    t.string "bond_number"
    t.boolean "is_copy", default: false, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["bond_id"], name: "index_bond_specifications_on_bond_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "title", null: false
    t.string "slug", null: false
    t.decimal "parent_category_id"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_categories_on_slug"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "value", null: false
    t.string "label", null: false
    t.string "link"
    t.string "scope", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["scope"], name: "index_contacts_on_scope"
  end

  create_table "products", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", null: false
    t.decimal "prices", precision: 1000, scale: 2, default: [], null: false, array: true
    t.date "valid_till"
    t.boolean "available", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "products_categories", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "category_id", null: false
    t.index ["category_id"], name: "index_products_categories_on_category_id"
    t.index ["product_id"], name: "index_products_categories_on_product_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string "email", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_subscriptions_on_email"
  end

end

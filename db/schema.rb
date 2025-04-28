# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2025_04_10_072551) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.bigint "supplier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_areas_on_supplier_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.integer "receive"
    t.integer "given"
    t.bigint "customer_id", null: false
    t.bigint "inventory_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "supplier_id"
    t.index ["customer_id"], name: "index_bookings_on_customer_id"
    t.index ["inventory_id"], name: "index_bookings_on_inventory_id"
  end

  create_table "customers", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.bigint "phone"
    t.string "email"
    t.bigint "supplier_id", null: false
    t.bigint "area_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["area_id"], name: "index_customers_on_area_id"
    t.index ["supplier_id"], name: "index_customers_on_supplier_id"
  end

  create_table "inventories", force: :cascade do |t|
    t.string "name"
    t.integer "price"
    t.integer "count"
    t.bigint "supplier_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_inventories_on_supplier_id"
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.string "company_name"
    t.bigint "mobile"
    t.text "address"
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image"
    t.string "provider"
    t.string "uid"
    t.index ["email"], name: "index_suppliers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_suppliers_on_reset_password_token", unique: true
  end

  add_foreign_key "areas", "suppliers"
  add_foreign_key "bookings", "customers"
  add_foreign_key "bookings", "inventories"
  add_foreign_key "customers", "areas"
  add_foreign_key "customers", "suppliers"
  add_foreign_key "inventories", "suppliers"
end

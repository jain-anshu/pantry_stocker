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

ActiveRecord::Schema[7.0].define(version: 2023_08_29_214049) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "categories_id"
    t.integer "quantity"
    t.bigint "units_id"
    t.integer "status", default: 0
    t.datetime "last_purchased_on"
    t.float "last_purchase_quantity"
    t.float "last_purchase_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "is_basic", default: false
    t.boolean "is_family_favorite", default: false
    t.string "also_known_as"
    t.integer "stores_id"
    t.index ["categories_id"], name: "index_ingredients_on_categories_id"
    t.index ["units_id"], name: "index_ingredients_on_units_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "distance_from_me"
    t.boolean "has_online_shopping_website", default: false
    t.string "website_url"
    t.boolean "is_available_on_instacart", default: false
    t.bigint "phone_number"
  end

  create_table "time_units", force: :cascade do |t|
    t.string "time_unit_name"
    t.float "days_per_unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name"
    t.integer "equivalent_weight_in_grams"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ingredients", "categories", column: "categories_id"
  add_foreign_key "ingredients", "stores", column: "stores_id"
  add_foreign_key "ingredients", "units", column: "units_id"
end

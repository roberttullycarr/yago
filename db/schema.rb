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

ActiveRecord::Schema[7.0].define(version: 2023_01_07_170447) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "entity_codes", force: :cascade do |t|
    t.bigint "legal_entity_id", null: false
    t.bigint "nacebel_code_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_entity_id"], name: "index_entity_codes_on_legal_entity_id"
    t.index ["nacebel_code_id"], name: "index_entity_codes_on_nacebel_code_id"
  end

  create_table "entity_profile_codes", force: :cascade do |t|
    t.bigint "entity_profile_id", null: false
    t.bigint "nacebel_code_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["entity_profile_id"], name: "index_entity_profile_codes_on_entity_profile_id"
    t.index ["nacebel_code_id"], name: "index_entity_profile_codes_on_nacebel_code_id"
  end

  create_table "entity_profiles", force: :cascade do |t|
    t.string "name"
    t.integer "cover_value"
    t.integer "deductible_value"
    t.integer "legal_value"
    t.text "cover_description"
    t.text "deductible_description"
    t.text "legal_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "legal_entities", force: :cascade do |t|
    t.bigint "annual_revenue"
    t.string "enterprise_number"
    t.string "legal_name"
    t.boolean "natural_person"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_legal_entities_on_user_id"
  end

  create_table "nacebel_codes", force: :cascade do |t|
    t.bigint "code"
    t.text "label"
    t.integer "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "quotes", force: :cascade do |t|
    t.boolean "available"
    t.bigint "coverage_ceiling"
    t.bigint "deductible"
    t.string "quote_id"
    t.string "coverage_ceiling_formula"
    t.string "deductible_formula"
    t.decimal "after_delivery_premium"
    t.decimal "public_liability_premium"
    t.decimal "professional_indemity_premium"
    t.decimal "entrusted_objects_premium"
    t.decimal "legal_expenses_premium"
    t.bigint "legal_entity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["legal_entity_id"], name: "index_quotes_on_legal_entity_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "phone_number"
    t.string "address_one"
    t.string "address_two"
    t.string "address_city"
    t.string "address_country"
    t.string "post_code"
    t.string "email"
    t.string "login_token"
    t.datetime "login_token_verified_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "entity_codes", "legal_entities"
  add_foreign_key "entity_codes", "nacebel_codes"
  add_foreign_key "entity_profile_codes", "entity_profiles"
  add_foreign_key "entity_profile_codes", "nacebel_codes"
end

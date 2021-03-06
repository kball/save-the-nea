# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170121225143) do

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.text   "description"
    t.index ["name"], name: "index_categories_on_name"
  end

  create_table "cities", force: :cascade do |t|
    t.string   "name"
    t.string   "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["state_id", "name"], name: "index_cities_on_state_id_and_name"
  end

  create_table "congressional_districts", force: :cascade do |t|
    t.integer "state_id"
    t.integer "number"
    t.index ["state_id", "number"], name: "index_congressional_districts_on_state_id_and_number"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"
  end

  create_table "grants", force: :cascade do |t|
    t.integer  "year"
    t.string   "number"
    t.string   "grantee"
    t.string   "organization_popular_name"
    t.string   "sponsored_organization"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "full_zip"
    t.integer  "congressional_district_id"
    t.decimal  "amount",                    precision: 8, scale: 2
    t.date     "start_date"
    t.date     "end_date"
    t.text     "intended_outcome"
    t.integer  "category_id"
    t.integer  "nea_discipline_id"
    t.integer  "project_discipline_id"
    t.text     "project_description"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "zipcode_id"
    t.index ["city_id", "year"], name: "index_grants_on_city_id_and_year"
    t.index ["congressional_district_id", "year"], name: "index_grants_on_congressional_district_id_and_year"
    t.index ["full_zip", "year"], name: "index_grants_on_full_zip_and_year"
    t.index ["number"], name: "index_grants_on_number"
    t.index ["state_id", "year"], name: "index_grants_on_state_id_and_year"
  end

  create_table "nea_disciplines", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name"], name: "index_nea_disciplines_on_name"
  end

  create_table "project_disciplines", force: :cascade do |t|
    t.string "name"
    t.text   "description"
    t.index ["name"], name: "index_project_disciplines_on_name"
  end

  create_table "states", force: :cascade do |t|
    t.string   "name"
    t.string   "abbrev"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "slug"
    t.index ["abbrev"], name: "index_states_on_abbrev"
    t.index ["name"], name: "index_states_on_name"
    t.index ["slug"], name: "index_states_on_slug", unique: true
  end

  create_table "zipcodes", force: :cascade do |t|
    t.string   "code"
    t.integer  "congressional_district_id"
    t.integer  "state_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.index ["code"], name: "index_zipcodes_on_code", unique: true
    t.index ["congressional_district_id"], name: "index_zipcodes_on_congressional_district_id"
    t.index ["state_id", "congressional_district_id"], name: "index_zipcodes_on_state_id_and_congressional_district_id"
  end

end

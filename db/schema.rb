# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160821103205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "consumption_patterns", force: :cascade do |t|
    t.datetime "time"
    t.float    "hour_01"
    t.float    "hour_02"
    t.float    "hour_03"
    t.float    "hour_04"
    t.float    "hour_05"
    t.float    "hour_06"
    t.float    "hour_07"
    t.float    "hour_08"
    t.float    "hour_09"
    t.float    "hour_10"
    t.float    "hour_11"
    t.float    "hour_12"
    t.float    "hour_13"
    t.float    "hour_14"
    t.float    "hour_15"
    t.float    "hour_16"
    t.float    "hour_17"
    t.float    "hour_18"
    t.float    "hour_19"
    t.float    "hour_20"
    t.float    "hour_21"
    t.float    "hour_22"
    t.float    "hour_23"
    t.float    "hour_24"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "user_id"
    t.integer  "solar_panel_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "contracts", ["solar_panel_id"], name: "index_contracts_on_solar_panel_id", using: :btree
  add_index "contracts", ["user_id"], name: "index_contracts_on_user_id", using: :btree

  create_table "production_patterns", force: :cascade do |t|
    t.datetime "time"
    t.float    "hour_01"
    t.float    "hour_02"
    t.float    "hour_03"
    t.float    "hour_04"
    t.float    "hour_05"
    t.float    "hour_06"
    t.float    "hour_07"
    t.float    "hour_08"
    t.float    "hour_09"
    t.float    "hour_10"
    t.float    "hour_11"
    t.float    "hour_12"
    t.float    "hour_13"
    t.float    "hour_14"
    t.float    "hour_15"
    t.float    "hour_16"
    t.float    "hour_17"
    t.float    "hour_18"
    t.float    "hour_19"
    t.float    "hour_20"
    t.float    "hour_21"
    t.float    "hour_22"
    t.float    "hour_23"
    t.float    "hour_24"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "solar_panel_id"
  end

  create_table "solar_panels", force: :cascade do |t|
    t.integer  "size"
    t.float    "efficiency"
    t.float    "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "family_size"
    t.integer  "apartment_size"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "address"
    t.integer  "premium"
    t.integer  "bill"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "consumption_patterns", "users"
  add_foreign_key "contracts", "solar_panels"
  add_foreign_key "contracts", "users"
  add_foreign_key "production_patterns", "solar_panels"
  add_foreign_key "solar_panels", "users"
end

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

ActiveRecord::Schema.define(version: 2019_12_02_220203) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "skipper_id"
    t.bigint "convoy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["convoy_id"], name: "index_applications_on_convoy_id"
    t.index ["skipper_id"], name: "index_applications_on_skipper_id"
  end

  create_table "boat_owners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "birthdate"
    t.string "city"
    t.text "description"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_boat_owners_on_email", unique: true
    t.index ["reset_password_token"], name: "index_boat_owners_on_reset_password_token", unique: true
  end

  create_table "convoys", force: :cascade do |t|
    t.bigint "boat_owner_id"
    t.string "title"
    t.string "boat_type"
    t.string "required_license"
    t.text "description"
    t.string "departure_port"
    t.string "arrival_port"
    t.datetime "date_of_departure"
    t.datetime "date_of_arrival"
    t.float "convoy_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boat_owner_id"], name: "index_convoys_on_boat_owner_id"
  end

  create_table "deliveries", force: :cascade do |t|
    t.bigint "skipper_id"
    t.bigint "convoy_id"
    t.string "stripe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["convoy_id"], name: "index_deliveries_on_convoy_id"
    t.index ["skipper_id"], name: "index_deliveries_on_skipper_id"
  end

  create_table "skippers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.datetime "birthdate"
    t.string "city"
    t.text "description"
    t.text "experience"
    t.text "licence"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_skippers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_skippers_on_reset_password_token", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
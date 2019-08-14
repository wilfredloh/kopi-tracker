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

ActiveRecord::Schema.define(version: 2019_08_14_075518) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "farms", force: :cascade do |t|
    t.string "location"
    t.string "phone_num"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "kopis", force: :cascade do |t|
    t.string "name"
    t.bigint "farm_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "roast_id"
    t.bigint "user_id"
    t.index ["farm_id"], name: "index_kopis_on_farm_id"
    t.index ["roast_id"], name: "index_kopis_on_roast_id"
    t.index ["user_id"], name: "index_kopis_on_user_id"
  end

  create_table "roasts", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "kopis", "roasts"
  add_foreign_key "kopis", "users"
end

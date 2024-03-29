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

ActiveRecord::Schema[7.0].define(version: 2024_03_20_004717) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bar_characteristics", force: :cascade do |t|
    t.bigint "characteristic_id", null: false
    t.bigint "bar_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_bar_characteristics_on_bar_id"
    t.index ["characteristic_id"], name: "index_bar_characteristics_on_characteristic_id"
  end

  create_table "bar_images", force: :cascade do |t|
    t.bigint "bar_id", null: false
    t.string "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id"], name: "index_bar_images_on_bar_id"
  end

  create_table "bars", force: :cascade do |t|
    t.string "name"
    t.text "display_address"
    t.text "description"
    t.float "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
    t.float "latitude"
    t.float "longitude"
  end

  create_table "characteristics", force: :cascade do |t|
    t.string "style"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.string "title"
    t.date "date_of_outing"
    t.time "time_of_outing"
    t.bigint "creater_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "winning_bar_id"
    t.index ["creater_id"], name: "index_groups_on_creater_id"
  end

  create_table "members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_members_on_group_id"
    t.index ["user_id"], name: "index_members_on_user_id"
  end

  create_table "preselected_bars", force: :cascade do |t|
    t.bigint "bar_id", null: false
    t.bigint "group_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bar_id", "group_id"], name: "index_preselected_bars_on_bar_id_and_group_id", unique: true
    t.index ["bar_id"], name: "index_preselected_bars_on_bar_id"
    t.index ["group_id"], name: "index_preselected_bars_on_group_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.boolean "vote"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "preselected_bar_id", null: false
    t.index ["preselected_bar_id"], name: "index_votes_on_preselected_bar_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "bar_characteristics", "bars"
  add_foreign_key "bar_characteristics", "characteristics"
  add_foreign_key "bar_images", "bars"
  add_foreign_key "groups", "users", column: "creater_id"
  add_foreign_key "members", "groups"
  add_foreign_key "members", "users"
  add_foreign_key "preselected_bars", "bars"
  add_foreign_key "preselected_bars", "groups"
  add_foreign_key "votes", "preselected_bars"
  add_foreign_key "votes", "users"
end

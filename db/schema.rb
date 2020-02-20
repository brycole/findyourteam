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

ActiveRecord::Schema.define(version: 2020_02_18_212606) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "applications", force: :cascade do |t|
    t.bigint "position_id"
    t.bigint "user_id"
    t.boolean "user_approval"
    t.boolean "owner_approval"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_id"], name: "index_applications_on_position_id"
    t.index ["user_id"], name: "index_applications_on_user_id"
  end

  create_table "games", force: :cascade do |t|
    t.string "title"
    t.string "genre"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "position_names", force: :cascade do |t|
    t.string "name"
    t.bigint "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_position_names_on_game_id"
  end

  create_table "positions", force: :cascade do |t|
    t.bigint "position_name_id"
    t.bigint "user_id"
    t.bigint "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["position_name_id"], name: "index_positions_on_position_name_id"
    t.index ["team_id"], name: "index_positions_on_team_id"
    t.index ["user_id"], name: "index_positions_on_user_id"
  end

  create_table "teams", force: :cascade do |t|
    t.bigint "game_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_teams_on_game_id"
    t.index ["user_id"], name: "index_teams_on_user_id"
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

  add_foreign_key "pending_applications", "positions"
  add_foreign_key "pending_applications", "users"
  add_foreign_key "position_names", "games"
  add_foreign_key "positions", "position_names"
  add_foreign_key "positions", "teams"
  add_foreign_key "positions", "users"
  add_foreign_key "teams", "games"
  add_foreign_key "teams", "users"
end

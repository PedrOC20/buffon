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

ActiveRecord::Schema.define(version: 2021_04_21_152525) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "club_requests", force: :cascade do |t|
    t.string "position"
    t.string "budget"
    t.string "salary"
    t.text "description"
    t.bigint "club_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["club_id"], name: "index_club_requests_on_club_id"
    t.index ["user_id"], name: "index_club_requests_on_user_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.date "founded"
    t.string "address"
    t.string "email"
    t.string "president"
    t.string "website"
    t.string "phone_number"
    t.string "club_url"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_comments_on_player_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "contacts", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone_number"
    t.string "role"
    t.string "importance"
    t.text "description"
    t.bigint "club_id", null: false
    t.bigint "user_id", null: false
    t.string "how_met"
    t.string "where_met"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "protected"
    t.index ["club_id"], name: "index_contacts_on_club_id"
    t.index ["user_id"], name: "index_contacts_on_user_id"
  end

  create_table "contracts", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.string "title"
    t.string "file"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_contracts_on_player_id"
  end

  create_table "evaluations", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "user_id", null: false
    t.integer "ball_control"
    t.integer "passing"
    t.integer "dribling"
    t.integer "heading"
    t.integer "finishing"
    t.integer "attack"
    t.integer "defense"
    t.integer "endurance"
    t.integer "speed"
    t.integer "agility"
    t.integer "strength"
    t.integer "drive"
    t.integer "aggressiveness"
    t.integer "determination"
    t.integer "responsability"
    t.integer "leadership"
    t.integer "self_confidence"
    t.integer "mental_toughness"
    t.integer "coachability"
    t.integer "set_pieces"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_evaluations_on_player_id"
    t.index ["user_id"], name: "index_evaluations_on_user_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "birth_date"
    t.string "birthplace"
    t.integer "age"
    t.string "height"
    t.string "nacionality"
    t.string "position"
    t.string "foot"
    t.string "manager"
    t.string "current_club"
    t.string "in_team_since"
    t.string "contract_until"
    t.string "equipment"
    t.string "social"
    t.string "player_url"
    t.string "photo"
    t.string "player_type"
    t.string "full_name"
    t.string "tax_number"
    t.string "address"
    t.string "passport_number"
    t.string "email"
    t.string "weight"
    t.string "position_2"
    t.string "position_3"
    t.string "internal_agent"
    t.string "agent_contract_expires"
    t.string "sponsor"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_contracts", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "contract1"
    t.string "contract2"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_user_contracts_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "address"
    t.string "fiscal_number"
    t.string "picture"
    t.string "phone_number"
    t.string "birth_date"
    t.boolean "active"
    t.boolean "admin"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "club_requests", "clubs"
  add_foreign_key "club_requests", "users"
  add_foreign_key "comments", "players"
  add_foreign_key "comments", "users"
  add_foreign_key "contacts", "clubs"
  add_foreign_key "contacts", "users"
  add_foreign_key "contracts", "players"
  add_foreign_key "evaluations", "players"
  add_foreign_key "evaluations", "users"
  add_foreign_key "user_contracts", "users"
end

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

ActiveRecord::Schema.define(version: 2020_05_09_184352) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "user_id", null: false
    t.text "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_comments_on_player_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
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
    t.bigint "player_id", null: false
    t.index ["player_id"], name: "index_evaluations_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.date "birth_date"
    t.string "birthplace"
    t.integer "age"
    t.integer "height"
    t.string "nacionality"
    t.string "position"
    t.string "foot"
    t.string "manager"
    t.string "current_club"
    t.date "in_team_since"
    t.date "contract_until"
    t.string "equipment"
    t.string "social"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
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
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "players"
  add_foreign_key "comments", "users"
  add_foreign_key "contracts", "players"
  add_foreign_key "evaluations", "players"
end

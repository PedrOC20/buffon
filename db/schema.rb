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

ActiveRecord::Schema.define(version: 2020_07_15_182332) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "club_requests", force: :cascade do |t|
    t.string "position"
    t.integer "budget"
    t.integer "salary"
    t.text "description"
    t.bigint "club_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["club_id"], name: "index_club_requests_on_club_id"
  end

  create_table "clubs", force: :cascade do |t|
    t.string "name"
    t.string "logo"
    t.date "founded"
    t.string "address"
    t.string "email"
    t.string "president"
    t.string "website"
    t.integer "phone_number"
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
    t.integer "phone_number"
    t.string "role"
    t.string "importance"
    t.text "description"
    t.bigint "club_id", null: false
    t.string "how_met"
    t.string "where_met"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["club_id"], name: "index_contacts_on_club_id"
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
    t.string "phone_number"
    t.string "height"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "club_requests", "clubs"
  add_foreign_key "comments", "players"
  add_foreign_key "comments", "users"
  add_foreign_key "contacts", "clubs"
  add_foreign_key "contracts", "players"
  add_foreign_key "evaluations", "players"
end

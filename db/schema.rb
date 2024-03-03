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

ActiveRecord::Schema[7.1].define(version: 2024_02_18_184846) do
  create_table "characters", primary_key: "codepoint", id: { type: :string, limit: 6 }, force: :cascade do |t|
    t.text "charname"
    t.string "category", limit: 2, null: false
    t.integer "combining", null: false
    t.string "bidi", limit: 3, null: false
    t.text "decomposition"
    t.integer "decimal"
    t.integer "digit"
    t.text "numeric"
    t.string "mirrored", limit: 1, null: false
    t.text "oldname"
    t.text "comment"
    t.string "uppercase", limit: 6
    t.string "lowercase", limit: 6
    t.string "titlecase", limit: 6
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["charname"], name: "index_characters_on_charname"
    t.index ["numeric"], name: "index_characters_on_numeric"
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "character_id", limit: 6, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["character_id"], name: "index_favorites_on_character_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "mail"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "favorites", "characters", primary_key: "codepoint"
  add_foreign_key "favorites", "users"
end

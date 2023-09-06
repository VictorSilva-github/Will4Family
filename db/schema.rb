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

ActiveRecord::Schema[7.0].define(version: 2023_09_06_142422) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "messages", force: :cascade do |t|
    t.integer "message_type"
    t.string "description"
    t.string "user_cheking"
    t.date "last_checking_at"
    t.string "tolerance_days"
    t.date "ultimate_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "receive_messages", force: :cascade do |t|
    t.bigint "message_id", null: false
    t.bigint "receive_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["message_id"], name: "index_receive_messages_on_message_id"
    t.index ["receive_id"], name: "index_receive_messages_on_receive_id"
  end

  create_table "receives", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "relationship"
    t.string "phone_number"
    t.string "additional_info"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_receives_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "fullname"
    t.string "gender"
    t.date "birthday"
    t.string "document_type"
    t.string "document_number"
    t.string "phone_number"
    t.string "post_code"
    t.string "address"
    t.string "city"
    t.string "country"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "messages", "users"
  add_foreign_key "receive_messages", "messages"
  add_foreign_key "receive_messages", "receives", column: "receive_id"
  add_foreign_key "receives", "users"
end

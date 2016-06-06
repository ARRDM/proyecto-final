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

ActiveRecord::Schema.define(version: 20160605004046) do

  create_table "messages", force: :cascade do |t|
    t.integer  "pet_id"
    t.integer  "petitioner"
    t.integer  "owner"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "text"
    t.string   "status"
  end

  add_index "messages", ["pet_id"], name: "index_messages_on_pet_id"

  create_table "pets", force: :cascade do |t|
    t.string   "name"
    t.string   "breed"
    t.string   "hair"
    t.string   "age"
    t.string   "gender"
    t.string   "size"
    t.text     "description"
    t.string   "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "image"
    t.integer  "user_id"
    t.boolean  "requested"
  end

  add_index "pets", ["user_id"], name: "index_pets_on_user_id"

  create_table "texts", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "message_id"
    t.boolean  "read"
  end

  add_index "texts", ["message_id"], name: "index_texts_on_message_id"
  add_index "texts", ["user_id"], name: "index_texts_on_user_id"

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "image"
    t.string   "user_name"
    t.string   "user_lastname_p"
    t.string   "user_lastname_m"
    t.string   "phone"
    t.string   "provider"
    t.string   "uid"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "address"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

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

ActiveRecord::Schema.define(version: 20141218160031) do

  create_table "breeds", force: true do |t|
    t.string   "name"
    t.integer  "breedable_id"
    t.string   "breedable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dogs", force: true do |t|
    t.string   "name"
    t.string   "titles"
    t.string   "sire"
    t.string   "dam"
    t.string   "sex"
    t.date     "date_of_birth"
    t.integer  "dogable_id"
    t.string   "dogable_type"
    t.integer  "person_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "dogs", ["dogable_id", "dogable_type"], name: "index_dogs_on_dogable_id_and_dogable_type"

  create_table "enrolments", force: true do |t|
    t.integer  "dog_id"
    t.integer  "exhibition_id"
    t.integer  "payment_id"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "partner"
    t.string   "dog_class"
  end

  create_table "exhibitions", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "tax"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payments", force: true do |t|
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "amount"
  end

  create_table "people", force: true do |t|
    t.string   "name"
    t.date     "date_of_birth"
    t.string   "sex"
    t.string   "country"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "sections", force: true do |t|
    t.integer  "group_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subsections", force: true do |t|
    t.integer  "section_id"
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subvarieties", force: true do |t|
    t.string   "name"
    t.integer  "variety_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",                  default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

  create_table "varieties", force: true do |t|
    t.string   "name"
    t.integer  "breed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

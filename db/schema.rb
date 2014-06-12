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

ActiveRecord::Schema.define(version: 20140611195911) do

  create_table "breeds", force: true do |t|
    t.string   "name"
    t.integer  "breedable_id"
    t.string   "breedable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groups", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
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

  create_table "varieties", force: true do |t|
    t.string   "name"
    t.integer  "breed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

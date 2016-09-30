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

ActiveRecord::Schema.define(version: 20160930061546) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "garrisons", force: :cascade do |t|
    t.integer  "reserve_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "garrisons", ["reserve_id"], name: "index_garrisons_on_reserve_id", using: :btree

  create_table "munitions", force: :cascade do |t|
    t.integer  "caliber"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "reserves", force: :cascade do |t|
    t.string   "initials"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "soldiers", force: :cascade do |t|
    t.string   "function"
    t.string   "warName"
    t.integer  "reserve_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "soldiers", ["reserve_id"], name: "index_soldiers_on_reserve_id", using: :btree

  create_table "weapons", force: :cascade do |t|
    t.integer  "serialNumber"
    t.string   "model"
    t.string   "factory"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "garrison_id"
  end

  add_index "weapons", ["garrison_id"], name: "index_weapons_on_garrison_id", using: :btree

end

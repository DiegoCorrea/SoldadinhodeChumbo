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

ActiveRecord::Schema.define(version: 20161010214205) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accessories", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "garrison_id"
    t.integer  "amount"
  end

  add_index "accessories", ["garrison_id"], name: "index_accessories_on_garrison_id", using: :btree

  create_table "garrisons", force: :cascade do |t|
    t.integer  "reserve_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "garrisons", ["reserve_id"], name: "index_garrisons_on_reserve_id", using: :btree

  create_table "loan_accessories", force: :cascade do |t|
    t.integer  "loan_id"
    t.integer  "accessory_id"
    t.integer  "reserve_id"
    t.integer  "amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "loan_accessories", ["accessory_id"], name: "index_loan_accessories_on_accessory_id", using: :btree
  add_index "loan_accessories", ["loan_id"], name: "index_loan_accessories_on_loan_id", using: :btree
  add_index "loan_accessories", ["reserve_id"], name: "index_loan_accessories_on_reserve_id", using: :btree

  create_table "loan_accessory_logs", force: :cascade do |t|
    t.integer  "loan_id"
    t.integer  "accessory_id"
    t.integer  "reserve_id"
    t.integer  "amount"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "loan_accessory_logs", ["accessory_id"], name: "index_loan_accessory_logs_on_accessory_id", using: :btree
  add_index "loan_accessory_logs", ["loan_id"], name: "index_loan_accessory_logs_on_loan_id", using: :btree
  add_index "loan_accessory_logs", ["reserve_id"], name: "index_loan_accessory_logs_on_reserve_id", using: :btree

  create_table "loan_munition_logs", force: :cascade do |t|
    t.integer  "loan_id"
    t.integer  "munition_id"
    t.integer  "reserve_id"
    t.integer  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "loan_munition_logs", ["loan_id"], name: "index_loan_munition_logs_on_loan_id", using: :btree
  add_index "loan_munition_logs", ["munition_id"], name: "index_loan_munition_logs_on_munition_id", using: :btree
  add_index "loan_munition_logs", ["reserve_id"], name: "index_loan_munition_logs_on_reserve_id", using: :btree

  create_table "loan_munitions", force: :cascade do |t|
    t.integer  "loan_id"
    t.integer  "munition_id"
    t.integer  "reserve_id"
    t.integer  "amount"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "loan_munitions", ["loan_id"], name: "index_loan_munitions_on_loan_id", using: :btree
  add_index "loan_munitions", ["munition_id"], name: "index_loan_munitions_on_munition_id", using: :btree
  add_index "loan_munitions", ["reserve_id"], name: "index_loan_munitions_on_reserve_id", using: :btree

  create_table "loan_weapon_logs", force: :cascade do |t|
    t.integer  "loan_id"
    t.integer  "weapon_id"
    t.integer  "reserve_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "loan_weapon_logs", ["loan_id"], name: "index_loan_weapon_logs_on_loan_id", using: :btree
  add_index "loan_weapon_logs", ["reserve_id"], name: "index_loan_weapon_logs_on_reserve_id", using: :btree
  add_index "loan_weapon_logs", ["weapon_id"], name: "index_loan_weapon_logs_on_weapon_id", using: :btree

  create_table "loan_weapons", force: :cascade do |t|
    t.integer  "loan_id"
    t.integer  "weapon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "reserve_id"
  end

  add_index "loan_weapons", ["loan_id"], name: "index_loan_weapons_on_loan_id", using: :btree
  add_index "loan_weapons", ["reserve_id"], name: "index_loan_weapons_on_reserve_id", using: :btree
  add_index "loan_weapons", ["weapon_id"], name: "index_loan_weapons_on_weapon_id", using: :btree

  create_table "loans", force: :cascade do |t|
    t.integer  "soldier_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "active"
  end

  add_index "loans", ["soldier_id"], name: "index_loans_on_soldier_id", using: :btree

  create_table "munitions", force: :cascade do |t|
    t.integer  "caliber"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "garrison_id"
    t.integer  "amount"
  end

  add_index "munitions", ["garrison_id"], name: "index_munitions_on_garrison_id", using: :btree

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

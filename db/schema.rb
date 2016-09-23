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

ActiveRecord::Schema.define(version: 20160923061828) do

  create_table "accessories", force: :cascade do |t|
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "allocated"
  end

  create_table "munitions", force: :cascade do |t|
    t.integer  "caliber"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.boolean  "allocated"
  end

  create_table "reserve_materials", force: :cascade do |t|
    t.integer  "weapons_id"
    t.integer  "accessories_id"
    t.integer  "munitions_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "reserve_materials", ["accessories_id"], name: "index_reserve_materials_on_accessories_id"
  add_index "reserve_materials", ["munitions_id"], name: "index_reserve_materials_on_munitions_id"
  add_index "reserve_materials", ["weapons_id"], name: "index_reserve_materials_on_weapons_id"

  create_table "weapons", force: :cascade do |t|
    t.integer  "serialNumber"
    t.string   "model"
    t.string   "factory"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "allocated"
  end

end

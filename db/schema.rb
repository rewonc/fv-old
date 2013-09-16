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

ActiveRecord::Schema.define(version: 20130916033115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "farms", force: true do |t|
    t.string   "title"
    t.string   "address"
    t.string   "state"
    t.string   "zip"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pickups", force: true do |t|
    t.integer  "farm_id"
    t.integer  "place_id"
    t.string   "address"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "places", force: true do |t|
    t.string   "title"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.decimal  "price",       precision: 7, scale: 2
    t.integer  "farm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["farm_id"], name: "index_products_on_farm_id", using: :btree

end

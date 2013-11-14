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

ActiveRecord::Schema.define(version: 20131114035802) do

  create_table "boxes", force: true do |t|
    t.integer  "box_num"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.integer  "frequency"
    t.integer  "delivery_preference"
    t.string   "street"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "instructions"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
    t.boolean  "paid"
  end

  create_table "charges", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "cart_id"
  end

  create_table "contacts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.string   "farmname"
    t.string   "markets"
    t.string   "produce"
  end

  create_table "emails", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "farmers", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
  end

  add_index "farmers", ["email"], name: "index_farmers_on_email", unique: true, using: :btree
  add_index "farmers", ["reset_password_token"], name: "index_farmers_on_reset_password_token", unique: true, using: :btree

  create_table "farms", force: true do |t|
    t.string   "title"
    t.string   "address"
    t.string   "state"
    t.string   "zip"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.integer  "farmer_id"
  end

  create_table "interval_pickups", force: true do |t|
    t.integer  "product_interval_id"
    t.integer  "pickup_id"
    t.integer  "processing_time"
    t.integer  "charge"
    t.integer  "charge1"
    t.integer  "charge2"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interval_pickups", ["pickup_id"], name: "index_interval_pickups_on_pickup_id", using: :btree
  add_index "interval_pickups", ["product_interval_id"], name: "index_interval_pickups_on_product_interval_id", using: :btree

  create_table "line_items", force: true do |t|
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",           default: 1
    t.integer  "interval_pickup_id"
  end

  create_table "pickups", force: true do |t|
    t.integer  "farm_id"
    t.integer  "place_id"
    t.string   "address"
    t.string   "zip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "period"
    t.string   "description"
    t.string   "latitude"
    t.string   "longitude"
  end

  create_table "places", force: true do |t|
    t.string   "title"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "product_intervals", force: true do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.integer  "base_price"
    t.datetime "time_start"
    t.datetime "time_end"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "product_tags"
  end

  add_index "product_intervals", ["product_id"], name: "index_product_intervals_on_product_id", using: :btree

  create_table "product_tags", force: true do |t|
    t.integer  "product_id"
    t.string   "options"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "product_tags", ["product_id"], name: "index_product_tags_on_product_id", using: :btree

  create_table "products", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "farm_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "products", ["farm_id"], name: "index_products_on_farm_id", using: :btree

  create_table "sms_loggers", force: true do |t|
    t.string   "body"
    t.string   "from"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

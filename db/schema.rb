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

ActiveRecord::Schema.define(version: 20140407163153) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string   "startdate"
    t.integer  "raw_num"
    t.integer  "cook_num"
    t.integer  "fruit_num"
    t.boolean  "text_me"
    t.boolean  "call_me"
    t.string   "neighborhood"
    t.integer  "module_1"
    t.integer  "module_2"
    t.integer  "module_3"
    t.integer  "module_4"
    t.integer  "module_5"
    t.integer  "module_6"
    t.integer  "module_7"
    t.string   "no_list"
    t.string   "promo"
  end

  create_table "charges", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
    t.string   "token"
  end

  add_index "charges", ["order_id"], name: "index_charges_on_order_id", using: :btree

  create_table "deliveries", force: true do |t|
    t.date     "shipping_date"
    t.boolean  "active"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deliveries", ["order_id"], name: "index_deliveries_on_order_id", using: :btree

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
  end

  add_index "farmers", ["email"], name: "index_farmers_on_email", unique: true, using: :btree
  add_index "farmers", ["reset_password_token"], name: "index_farmers_on_reset_password_token", unique: true, using: :btree

  create_table "juiceboxes", force: true do |t|
    t.integer  "box_num"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.integer  "frequency"
    t.integer  "delivery_preference"
    t.string   "startdate"
    t.string   "street"
    t.string   "street2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "instructions"
    t.boolean  "text_me"
    t.boolean  "call_me"
    t.string   "promo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", force: true do |t|
    t.integer  "box_count"
    t.integer  "frequency"
    t.string   "fullname"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "phone"
    t.integer  "delivery_window"
    t.date     "first_delivery"
    t.integer  "user_id"
    t.integer  "product_id"
    t.integer  "promocode_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.integer  "price"
    t.text     "box_num_menu"
    t.text     "delivery_frequency_menu"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link"
    t.string   "note"
    t.integer  "shipping"
  end

  create_table "promocodes", force: true do |t|
    t.string   "code"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sms_loggers", force: true do |t|
    t.string   "body"
    t.string   "from"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "usdas", force: true do |t|
    t.string   "cityName"
    t.string   "commodityName"
    t.string   "packageDesc"
    t.string   "varietyName"
    t.string   "subvarName"
    t.string   "gradeDesc"
    t.string   "type_renamed"
    t.date     "date"
    t.integer  "lowMin"
    t.integer  "highMax"
    t.string   "originName"
    t.string   "districtName"
    t.string   "itemSize"
    t.string   "environment"
    t.string   "color"
    t.string   "unitSale"
    t.string   "quality"
    t.string   "condition"
    t.string   "storage"
    t.string   "appearance"
    t.string   "crop"
    t.string   "transmode"
    t.string   "repack"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usdas", ["cityName"], name: "index_usdas_on_cityName", using: :btree
  add_index "usdas", ["commodityName"], name: "index_usdas_on_commodityName", using: :btree
  add_index "usdas", ["date"], name: "index_usdas_on_date", using: :btree

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
    t.string   "first"
    t.string   "last"
    t.string   "zip"
    t.integer  "promocode_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end

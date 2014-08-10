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

ActiveRecord::Schema.define(version: 20140810081136) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.string   "code"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "indicator_sources", force: true do |t|
    t.integer  "indicator_id"
    t.string   "title"
    t.integer  "year"
    t.integer  "month"
    t.string   "url"
    t.string   "authority"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "sub_title"
    t.boolean  "active",       default: true, null: false
  end

  add_index "indicator_sources", ["indicator_id"], name: "index_indicator_sources_on_indicator_id", using: :btree

  create_table "indicators", force: true do |t|
    t.integer  "category_id"
    t.string   "code"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "plus",        default: true, null: false
  end

  add_index "indicators", ["category_id"], name: "index_indicators_on_category_id", using: :btree

  create_table "municipalities", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "open_data", force: true do |t|
    t.integer  "municipality_id"
    t.integer  "indicator_source_id"
    t.integer  "value"
    t.float    "deviation_value"
    t.text     "memo"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "open_data", ["indicator_source_id"], name: "index_open_data_on_indicator_source_id", using: :btree
  add_index "open_data", ["municipality_id"], name: "index_open_data_on_municipality_id", using: :btree

end

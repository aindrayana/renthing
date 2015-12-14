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

ActiveRecord::Schema.define(version: 20151212060942) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "file_name"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "images", ["item_id"], name: "index_images_on_item_id", using: :btree

  create_table "items", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "hourly_rate"
    t.string   "daily_rate"
    t.string   "weekly_rate"
    t.string   "monthly_rate"
    t.boolean  "isavailable"
    t.boolean  "ispublish"
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "password_digest"
    t.text     "address"
    t.text     "aboutme"
    t.string   "facebook_url"
    t.string   "twitter_url"
    t.boolean  "isadmin"
    t.boolean  "isbanned"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "apt_suite_no"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.float    "longitude"
    t.float    "latitude"
    t.string   "avatars"
  end

  add_foreign_key "images", "items"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users"
end

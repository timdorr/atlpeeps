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

ActiveRecord::Schema.define(version: 20140414045244) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "identities", force: true do |t|
    t.integer  "user_id"
    t.string   "provider"
    t.text     "uid"
    t.text     "info"
    t.text     "extra"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["user_id"], name: "index_identities_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.text     "name",                               null: false
    t.text     "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "website"
    t.text     "bio"
    t.boolean  "approved",           default: false
    t.boolean  "published",          default: false
    t.boolean  "admin"
    t.json     "categories"
    t.boolean  "atv"
  end

  add_index "users", ["published", "approved", "atv"], name: "index_users_on_published_and_approved_and_atv", using: :btree

end

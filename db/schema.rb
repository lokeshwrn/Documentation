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

ActiveRecord::Schema.define(version: 20150925195613) do

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.text     "content"
    t.integer  "user_id"
    t.boolean  "status",         default: false
    t.string   "reference_url"
    t.string   "github_url"
    t.integer  "comments_count", default: 0
    t.integer  "rating",         default: 0
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "category"
  end

  create_table "menus", force: :cascade do |t|
    t.string   "title"
    t.integer  "parent_id"
    t.boolean  "status",          default: false
    t.string   "alias_name"
    t.string   "access"
    t.string   "controller"
    t.string   "action"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "sequence_number"
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.string   "role",          default: "user"
    t.boolean  "status",        default: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

end

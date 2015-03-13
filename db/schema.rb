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

ActiveRecord::Schema.define(version: 20150216170958) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "item_comments", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "item_id",    null: false
    t.text     "content",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string   "title",                           null: false
    t.string   "url"
    t.text     "content"
    t.integer  "user_id",                         null: false
    t.boolean  "disabled",        default: false, null: false
    t.integer  "comments_count",  default: 0,     null: false
    t.integer  "upvotes_count",   default: 0,     null: false
    t.integer  "downvotes_count", default: 0,     null: false
    t.integer  "score",           default: 0,     null: false
    t.integer  "rank",            default: 0,     null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "items", ["disabled"], name: "index_items_on_disabled", using: :btree
  add_index "items", ["user_id"], name: "index_items_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",                             null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.boolean  "admin",                default: false, null: false
    t.boolean  "disabled",             default: false, null: false
    t.integer  "karma",                default: 0,     null: false
    t.text     "about"
    t.string   "auth"
    t.string   "token"
    t.datetime "karma_increment_time"
    t.datetime "pwd_reset"
    t.integer  "replies_count",        default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["auth", "token"], name: "index_users_on_auth_and_token", using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id",      null: false
    t.integer  "votable_id",   null: false
    t.string   "votable_type", null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "votes", ["user_id", "votable_id", "votable_type"], name: "index_votes_on_user_id_and_votable_id_and_votable_type", unique: true, using: :btree

end

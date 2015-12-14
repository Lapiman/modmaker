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

ActiveRecord::Schema.define(version: 20151205224059) do

  create_table "blocks", force: true do |t|
    t.string   "blockid"
    t.string   "name"
    t.integer  "mod_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blocks", ["mod_id"], name: "index_blocks_on_mod_id"

  create_table "items", force: true do |t|
    t.string   "itemid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mod_id"
  end

  create_table "mods", force: true do |t|
    t.string   "name"
    t.string   "author"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "modid"
    t.string   "description"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

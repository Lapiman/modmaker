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

ActiveRecord::Schema.define(version: 20160502143751) do

  create_table "blocks", force: true do |t|
    t.string   "blockid"
    t.string   "name"
    t.integer  "mod_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "max_stack_size"
    t.integer  "creative_tab"
    t.float    "hardness"
    t.integer  "step_sound"
    t.integer  "harvest_tool"
    t.integer  "harvest_level"
    t.integer  "material"
    t.integer  "light_level"
  end

  add_index "blocks", ["mod_id"], name: "index_blocks_on_mod_id"

  create_table "items", force: true do |t|
    t.string   "itemid"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "mod_id"
    t.integer  "max_stack_size"
    t.string   "creative_tab"
    t.string   "texture_file_name"
    t.string   "texture_content_type"
    t.integer  "texture_file_size"
    t.datetime "texture_updated_at"
  end

  create_table "mods", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "modid"
    t.string   "description"
    t.integer  "user_id"
    t.string   "package_name"
    t.string   "version_number"
  end

  add_index "mods", ["user_id"], name: "index_mods_on_user_id"

  create_table "users", force: true do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end

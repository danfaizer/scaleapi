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

ActiveRecord::Schema.define(version: 20140222091908) do

  create_table "credentials", force: true do |t|
    t.integer  "host_id",                               null: false
    t.string   "apikey",     limit: 16,                 null: false
    t.string   "apisecret",  limit: 32,                 null: false
    t.boolean  "readonly",              default: false, null: false
    t.datetime "created_at",                            null: false
    t.datetime "locked_at"
    t.boolean  "locked",                default: false, null: false
  end

  add_index "credentials", ["apikey"], name: "index_credentials_on_apikey", unique: true, using: :btree

  create_table "enterprises", force: true do |t|
    t.string   "name",       limit: 50,                 null: false
    t.datetime "created_at",                            null: false
    t.datetime "locked_at"
    t.boolean  "locked",                default: false, null: false
  end

  create_table "hosts", force: true do |t|
    t.integer  "enterprise_id",                            null: false
    t.string   "uuid",          limit: 36,                 null: false
    t.string   "name",          limit: 50,                 null: false
    t.datetime "created_at",                               null: false
    t.datetime "locked_at"
    t.boolean  "locked",                   default: false, null: false
  end

  add_index "hosts", ["uuid"], name: "index_hosts_on_uuid", unique: true, using: :btree

end

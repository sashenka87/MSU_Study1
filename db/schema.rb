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

ActiveRecord::Schema.define(version: 20140320051046) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "participants", force: true do |t|
    t.string   "session_id"
    t.string   "ip_address"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "instructor"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "participants", ["session_id"], name: "index_participants_on_session_id", using: :btree

  create_table "rankings", force: true do |t|
    t.integer  "stance_id"
    t.string   "source_name"
    t.integer  "category"
    t.integer  "useful_ranking"
    t.string   "useful_justification"
    t.integer  "trustworthy_ranking"
    t.string   "trustworthy_justification"
    t.integer  "accurate_ranking"
    t.string   "accurate_justification"
    t.integer  "interesting_ranking"
    t.string   "interesting_justification"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rankings", ["stance_id"], name: "index_rankings_on_stance_id", using: :btree

  create_table "sources", force: true do |t|
    t.integer  "stance_id"
    t.integer  "order"
    t.integer  "time_duration"
    t.integer  "trustworthy"
    t.integer  "useful"
    t.integer  "accurate"
    t.integer  "interesting"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source_name"
    t.integer  "depth",         default: 0
  end

  add_index "sources", ["stance_id"], name: "index_sources_on_stance_id", using: :btree

  create_table "stances", force: true do |t|
    t.integer  "participant_id"
    t.integer  "supporting"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "statement"
  end

  add_index "stances", ["participant_id"], name: "index_stances_on_participant_id", using: :btree

end

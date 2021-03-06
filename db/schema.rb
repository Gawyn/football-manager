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

ActiveRecord::Schema.define(version: 20130803134155) do

  create_table "league_positions", force: true do |t|
    t.integer  "points"
    t.integer  "team_id"
    t.integer  "league_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "leagues", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "matches", force: true do |t|
    t.integer  "home_team_id"
    t.integer  "away_team_id"
    t.integer  "home_team_score"
    t.integer  "away_team_score"
    t.boolean  "pending",         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "date"
  end

  create_table "players", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.string   "position"
    t.integer  "quality"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "starting",   default: false
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.integer  "league_id"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "avatar"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

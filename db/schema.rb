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

ActiveRecord::Schema.define(version: 20150521190349) do

  create_table "speakers", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "team"
    t.boolean  "current"
    t.boolean  "external"
  end

  create_table "speakers_talks", id: false, force: true do |t|
    t.integer "speaker_id"
    t.integer "talk_id"
  end

  add_index "speakers_talks", ["speaker_id"], name: "index_speakers_talks_on_speaker_id"
  add_index "speakers_talks", ["talk_id"], name: "index_speakers_talks_on_talk_id"

  create_table "talks", force: true do |t|
    t.string   "title"
    t.date     "date"
    t.string   "slides"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

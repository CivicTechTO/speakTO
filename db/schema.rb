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

ActiveRecord::Schema.define(version: 20160918011457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "concepts", force: :cascade do |t|
    t.integer  "deputation_id"
    t.string   "text"
    t.float    "relevance"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "deputations", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "postal_code"
    t.text     "transcription"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
  end

  create_table "keywords", force: :cascade do |t|
    t.integer  "deputation_id"
    t.string   "text"
    t.float    "relevance"
    t.string   "sentiment"
    t.float    "sentiment_strength"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "video_uploads", force: :cascade do |t|
    t.string   "video"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

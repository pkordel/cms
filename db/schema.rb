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

ActiveRecord::Schema.define(version: 20130330182451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "article_types", force: true do |t|
    t.string   "name"
    t.hstore   "fields"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "article_types", ["fields"], name: "article_types_gin_fields", using: :gin

  create_table "articles", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.hstore   "metadata"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "article_type_id"
  end

  add_index "articles", ["metadata"], name: "articles_gin_metadata", using: :gin

end

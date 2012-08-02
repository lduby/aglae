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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120728210017) do

  create_table "borrowings", :force => true do |t|
    t.date     "outDate"
    t.date     "backDate"
    t.integer  "member_id"
    t.integer  "game_copy_id"
    t.integer  "child_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "children", :force => true do |t|
    t.integer  "member_id"
    t.string   "lastname"
    t.string   "firstname"
    t.date     "birthdate"
    t.string   "sex"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "game_copies", :force => true do |t|
    t.string   "game_id"
    t.date     "purchase_date"
    t.string   "condition"
    t.string   "status"
    t.float    "RentPrice"
    t.float    "PurchasePrice"
    t.string   "location"
    t.string   "comment"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "game_copy_checks", :force => true do |t|
    t.date     "date"
    t.integer  "game_copy_id"
    t.string   "comment"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "game_copy_contents", :force => true do |t|
    t.integer  "game_copy_id"
    t.integer  "game_piece_id"
    t.string   "condition"
    t.string   "comment"
    t.boolean  "is_missing"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "game_pieces", :force => true do |t|
    t.integer  "game_id"
    t.string   "label"
    t.integer  "order"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "games", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "manufacturer"
    t.string   "supplier"
    t.string   "min_age"
    t.integer  "min_nb_player"
    t.integer  "max_nb_player"
    t.string   "average_length"
    t.string   "category"
    t.string   "type"
    t.string   "rule"
    t.string   "picture"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  add_index "games", ["manufacturer"], :name => "index_games_on_manufacturer"

  create_table "members", :force => true do |t|
    t.string   "lastname"
    t.string   "firstname"
    t.string   "type"
    t.string   "organization"
    t.string   "address"
    t.string   "zipcode"
    t.string   "city"
    t.string   "phone"
    t.string   "occupation"
    t.date     "birthdate"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "members", ["city"], :name => "index_members_on_city"
  add_index "members", ["firstname"], :name => "index_members_on_firstname"
  add_index "members", ["lastname"], :name => "index_members_on_lastname"
  add_index "members", ["organization"], :name => "index_members_on_organization"
  add_index "members", ["zipcode"], :name => "index_members_on_zipcode"

end

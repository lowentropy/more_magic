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

ActiveRecord::Schema.define(:version => 20111019194638) do

  create_table "card_groups", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "card_sets", :force => true do |t|
    t.string   "name"
    t.integer  "card_group_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code"
  end

  add_index "card_sets", ["card_group_id"], :name => "index_card_sets_on_card_group_id"

  create_table "cards", :force => true do |t|
    t.integer  "num"
    t.string   "name"
    t.string   "card_type"
    t.string   "mana"
    t.string   "rarity"
    t.string   "artist"
    t.integer  "card_set_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["card_set_id"], :name => "index_cards_on_card_set_id"

  create_table "collections", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "copies", :force => true do |t|
    t.integer  "deck_id"
    t.boolean  "sideboard"
    t.integer  "card_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "count"
  end

  add_index "copies", ["card_id"], :name => "index_copies_on_card_id"
  add_index "copies", ["deck_id"], :name => "index_copies_on_deck_id"

  create_table "decks", :force => true do |t|
    t.string   "name"
    t.integer  "collection_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "left_over",     :default => false
    t.string   "sleeve_color"
  end

  add_index "decks", ["collection_id"], :name => "index_decks_on_collection_id"

  create_table "prices", :force => true do |t|
    t.integer  "card_id"
    t.decimal  "low",        :precision => 7, :scale => 2
    t.decimal  "mid",        :precision => 7, :scale => 2
    t.decimal  "high",       :precision => 7, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

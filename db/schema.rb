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

ActiveRecord::Schema.define(version: 20170507220204) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cities", force: :cascade do |t|
    t.string   "name",           null: false
    t.integer  "state_id"
    t.string   "capitable_type"
    t.integer  "capitable_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["capitable_type", "capitable_id"], name: "index_cities_on_capitable_type_and_capitable_id", using: :btree
    t.index ["state_id"], name: "index_cities_on_state_id", using: :btree
  end

  create_table "nations", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "states", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "nation_id",  null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "nation_id"], name: "index_states_on_name_and_nation_id", unique: true, using: :btree
    t.index ["nation_id"], name: "index_states_on_nation_id", using: :btree
  end

end

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

ActiveRecord::Schema.define(version: 20140830125429) do

  create_table "ad_descriptions", force: true do |t|
    t.text     "content"
    t.integer  "ad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ad_extras", force: true do |t|
    t.boolean  "clima"
    t.boolean  "abs"
    t.boolean  "asr"
    t.boolean  "eds"
    t.boolean  "esp"
    t.boolean  "alu"
    t.boolean  "alarm"
    t.boolean  "diff"
    t.boolean  "gearbox_block"
    t.boolean  "central_lock"
    t.boolean  "rain_ind"
    t.boolean  "electric_mirrors"
    t.boolean  "electric_windows"
    t.boolean  "hook"
    t.boolean  "immobilliser"
    t.boolean  "gas"
    t.boolean  "xenons"
    t.boolean  "heat_seats"
    t.boolean  "leather_seats"
    t.boolean  "gps_nav"
    t.boolean  "fog_lights"
    t.boolean  "tempomat"
    t.boolean  "wheel_helper"
    t.boolean  "t4x4"
    t.integer  "ad_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ad_images", force: true do |t|
    t.string   "image2"
    t.string   "image3"
    t.string   "image4"
    t.string   "image5"
    t.string   "image6"
    t.string   "image7"
    t.string   "image8"
    t.string   "image9"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image1"
    t.integer  "ad_id"
  end

  create_table "ads", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "price"
    t.integer  "type_id"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "production_year"
    t.integer  "km"
    t.integer  "power"
    t.integer  "engine_size"
    t.string   "gearbox"
    t.string   "fuel"
    t.string   "exterior_type"
    t.string   "color"
    t.integer  "doors"
    t.string   "phone"
    t.integer  "user_id"
    t.string   "email"
  end

  create_table "brands", force: true do |t|
    t.string   "brand_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "types", force: true do |t|
    t.string   "model_name"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

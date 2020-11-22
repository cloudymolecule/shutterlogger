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

ActiveRecord::Schema.define(version: 20201122044544) do

  create_table "camera_photos", force: :cascade do |t|
    t.integer  "camera_id"
    t.integer  "photo_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cameras", force: :cascade do |t|
    t.string   "nickname"
    t.string   "make"
    t.string   "model"
    t.boolean  "loaded"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "lens", force: :cascade do |t|
    t.string   "make"
    t.string   "model"
    t.float    "max_aperture"
    t.float    "min_aperture"
    t.integer  "camera_id"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "photos", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "shutter"
    t.float    "aperture"
    t.string   "date"
    t.string   "time"
    t.string   "location"
    t.integer  "rating"
    t.integer  "roll_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "rolls", force: :cascade do |t|
    t.integer  "exp_count"
    t.integer  "iso"
    t.string   "brand"
    t.string   "comments"
    t.integer  "camera_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
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

ActiveRecord::Schema.define(:version => 20131124032443) do

  create_table "coil_assays", :force => true do |t|
    t.string   "subdivision"
    t.datetime "dttm"
    t.string   "route"
    t.float    "moisture"
    t.float    "wf_ash"
    t.float    "df_ash"
    t.float    "letuch"
    t.float    "sera"
    t.float    "ncv"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "gaz_assays", :force => true do |t|
    t.string   "subdivision"
    t.datetime "dttm"
    t.float    "ncv"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "masut_assays", :force => true do |t|
    t.string   "subdivision"
    t.datetime "dttm"
    t.float    "density"
    t.float    "moisture"
    t.float    "sera"
    t.float    "flash_point"
    t.float    "ash"
    t.float    "ncv"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password_digest"
    t.string   "surname"
    t.string   "name"
    t.string   "subdivision"
    t.string   "role"
    t.integer  "login_count"
    t.string   "last_login"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end

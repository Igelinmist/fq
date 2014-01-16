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

ActiveRecord::Schema.define(:version => 20140109070502) do

  create_table "coil_assays", :force => true do |t|
    t.string   "subdivision"
    t.datetime "dttm"
    t.string   "route"
    t.float    "w_r_t"
    t.float    "a_r"
    t.float    "a_d"
    t.float    "v_daf"
    t.float    "s_a"
    t.float    "q_r_i"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "is_suplier_assay", :default => false
    t.boolean  "is_public_info",   :default => false
    t.float    "w_a"
    t.float    "a_a"
    t.float    "q_a_b"
    t.float    "q_d_s"
    t.float    "q_daf_s"
    t.float    "v_a"
    t.float    "h_a"
    t.integer  "protocol_num"
    t.string   "coil_class"
    t.string   "supplier"
  end

  create_table "gaz_assays", :force => true do |t|
    t.string   "subdivision"
    t.datetime "dttm"
    t.float    "ncv"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "is_suplier_assay", :default => false
    t.boolean  "is_public_info",   :default => false
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
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.boolean  "is_suplier_assay", :default => false
    t.boolean  "is_public_info",   :default => false
  end

  create_table "news", :force => true do |t|
    t.datetime "dttm"
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "password_digest"
    t.string   "surname"
    t.string   "name"
    t.string   "subdivision"
    t.integer  "login_count",     :default => 0
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.datetime "last_login"
    t.integer  "grants",          :default => 0
  end

end

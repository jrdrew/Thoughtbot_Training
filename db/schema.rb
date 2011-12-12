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

ActiveRecord::Schema.define(:version => 20111212171303) do

  create_table "photos", :force => true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_one_file_name"
    t.string   "attachment_one_content_type"
    t.integer  "attachment_one_file_size"
    t.datetime "attachment_one_updated_at"
  end

  create_table "posts", :force => true do |t|
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "updates", :force => true do |t|
    t.string   "content_type"
    t.integer  "content_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "updates", ["user_id"], :name => "index_updates_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end

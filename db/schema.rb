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

ActiveRecord::Schema.define(:version => 20110410053100) do

  create_table "boxes", :force => true do |t|
    t.string   "name"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "classrooms", :force => true do |t|
    t.string   "class_name"
    t.string   "teacher"
    t.string   "phone"
    t.string   "email"
    t.text     "wish_list"
    t.integer  "institution_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "classrooms", ["class_name"], :name => "index_classrooms_on_class_name", :unique => true
  add_index "classrooms", ["teacher"], :name => "index_classrooms_on_teacher"

  create_table "donations", :force => true do |t|
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "ad_website"
    t.string   "email"
    t.integer  "box_quantity"
    t.string   "custom_institution_name"
    t.string   "custom_classroom_name"
    t.string   "custom_classroom_teacher"
    t.string   "custom_classroom_school"
    t.integer  "institution_id"
    t.integer  "classroom_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "donations", ["email"], :name => "index_donations_on_email"
  add_index "donations", ["first_name"], :name => "index_donations_on_first_name"
  add_index "donations", ["last_name"], :name => "index_donations_on_last_name"

  create_table "institutions", :force => true do |t|
    t.string   "name"
    t.string   "school_site"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_title"
    t.string   "street_one"
    t.string   "street_two"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "phone"
    t.text     "wish_list"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "institutions", ["name"], :name => "index_institutions_on_name", :unique => true

  create_table "rails_admin_histories", :force => true do |t|
    t.string   "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_histories_on_item_and_table_and_month_and_year"

  create_table "users", :force => true do |t|
    t.string   "email",                                               :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "username",                                            :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true
  add_index "users", ["username"], :name => "index_users_on_username", :unique => true

end

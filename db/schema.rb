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

ActiveRecord::Schema.define(:version => 20120627022417) do

  create_table "customers", :force => true do |t|
    t.string "name"
    t.string "telephone"
    t.integer "owner_id"
    t.integer "organization_id"
    t.string "company"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "country"
    t.string "phone"
    t.string "mobile_phone"
    t.string "work_phone"
    t.string "email"
    t.integer "billing_status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "microposts", :force => true do |t|
    t.string "content"
    t.integer "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "microposts", ["user_id", "created_at"], :name => "index_microposts_on_user_id_and_created_at"

  create_table "organizations", :force => true do |t|
    t.string "name"
    t.string "telephone"
    t.string "website"
    t.string "company"
    t.string "address1"
    t.string "address2"
    t.string "city"
    t.string "state"
    t.string "zip"
    t.string "country"
    t.string "mobile"
    t.string "work_phone"
    t.string "email"
    t.boolean "subcontrax_member"
    t.integer "status"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "relationships", :force => true do |t|
    t.integer "follower_id"
    t.integer "followed_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "service_calls", :force => true do |t|
    t.string "name"
    t.string "notes"
    t.integer "status"
    t.datetime "started_on"
    t.integer "customer_id"
    t.integer "customer_contract_id"
    t.datetime "completed_on"
    t.date "settlement_date"
    t.string "settlement_status"
    t.string "type"
    t.integer "bom_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tickets", :force => true do |t|
    t.string "name"
    t.string "description"
    t.integer "status"
    t.datetime "started_on"
    t.integer "customer_id"
    t.integer "customer_contract_id"
    t.datetime "completed_on"
    t.date "settlement_date"
    t.string "settlement_status"
    t.string "type"
    t.integer "bom_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string "password_digest"
    t.string "remember_token"
    t.boolean "admin", :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end

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

ActiveRecord::Schema.define(:version => 20120516130336) do

  create_table "appointments", :force => true do |t|
    t.integer  "project_id"
    t.text     "description"
    t.datetime "appointment"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "comments", :force => true do |t|
    t.integer  "project_id"
    t.integer  "person_id"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "people", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
  end

  create_table "persons_projects_roles", :id => false, :force => true do |t|
    t.integer "person_id"
    t.integer "project_id"
    t.integer "role_id"
  end

  create_table "pictures", :force => true do |t|
    t.integer  "project_id"
    t.text     "path"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "projects", :force => true do |t|
    t.string   "title"
    t.string   "status"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_sessions", :force => true do |t|
    t.string   "login"
    t.string   "password"
    t.string   "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "fhsid"
    t.string   "firstname"
    t.string   "surname"
    t.string   "title"
    t.string   "email"
    t.integer  "isfemale"
    t.integer  "profile_visible"
    t.integer  "is_admin"
    t.text     "description"
    t.string   "cached_slug"
    t.string   "avatar"
    t.string   "fullname"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end

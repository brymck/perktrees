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

ActiveRecord::Schema.define(:version => 20111116031513) do

  create_table "minor_skills_races", :id => false, :force => true do |t|
    t.integer "skill_id"
    t.integer "race_id"
  end

  add_index "minor_skills_races", ["skill_id", "race_id"], :name => "index_minor_skills_races_on_skill_id_and_race_id"

  create_table "perks", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "ranks",                                 :default => 1
    t.integer  "skill_id"
    t.integer  "skill_points",                          :default => 0
    t.integer  "additional_skill_points_for_next_rank", :default => 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "perks", ["skill_id"], :name => "index_perks_on_skill_id"

  create_table "perks_prerequisites", :id => false, :force => true do |t|
    t.integer "perk_id"
    t.integer "prerequisite_id"
  end

  add_index "perks_prerequisites", ["perk_id", "prerequisite_id"], :name => "index_perks_prerequisites_on_perk_id_and_prerequisite_id"

  create_table "races", :force => true do |t|
    t.string   "name"
    t.integer  "major_skill_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "races", ["major_skill_id"], :name => "index_races_on_major_skill_id"

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end

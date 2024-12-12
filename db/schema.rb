# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_12_10_143944) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "lists", primary_key: "list_number", force: :cascade do |t|
    t.string "name"
    t.bigint "school_year_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["school_year_id"], name: "index_lists_on_school_year_id"
  end

  create_table "school_years", force: :cascade do |t|
    t.string "name"
    t.date "start_date"
    t.date "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.boolean "completed", default: false
    t.string "class_name"
    t.integer "list_number"
    t.bigint "school_year_id"
    t.date "due_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["list_number", "due_date"], name: "index_tasks_on_list_number_and_due_date"
    t.index ["list_number"], name: "index_tasks_on_list_number"
    t.index ["school_year_id"], name: "index_tasks_on_school_year_id"
  end

  add_foreign_key "lists", "school_years"
  add_foreign_key "tasks", "school_years"
end

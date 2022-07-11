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

ActiveRecord::Schema[7.0].define(version: 2022_06_29_004331) do
  create_table "departments", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "employees", force: :cascade do |t|
    t.integer "department_id", null: false
    t.string "name", null: false
    t.integer "mode", default: 0
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_employees_on_department_id"
    t.index ["name"], name: "index_employees_on_name"
  end

  create_table "pay_categories", force: :cascade do |t|
    t.integer "parent_id"
    t.string "name", null: false
    t.integer "mode"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_pay_categories_on_parent_id"
  end

  create_table "pays", force: :cascade do |t|
    t.integer "department_id", null: false
    t.integer "employee_id", null: false
    t.integer "category_id", null: false
    t.integer "year", null: false
    t.integer "month", null: false
    t.float "sum", default: 0.0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_pays_on_category_id"
    t.index ["department_id"], name: "index_pays_on_department_id"
    t.index ["employee_id"], name: "index_pays_on_employee_id"
  end

  add_foreign_key "employees", "departments"
  add_foreign_key "pays", "departments"
  add_foreign_key "pays", "employees"
end

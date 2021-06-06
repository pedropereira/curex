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

ActiveRecord::Schema.define(version: 2021_06_06_231039) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "project_credentials", force: :cascade do |t|
    t.string "api_key", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "project_id", null: false
    t.index ["api_key"], name: "index_project_credentials_on_api_key"
    t.index ["project_id"], name: "index_project_credentials_on_project_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_projects_on_name", unique: true
  end

  create_table "projects_rates", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "projects_id"
    t.bigint "rates_id"
    t.index ["projects_id"], name: "index_projects_rates_on_projects_id"
    t.index ["rates_id"], name: "index_projects_rates_on_rates_id"
  end

  create_table "rate_values", force: :cascade do |t|
    t.float "value", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "rate_id", null: false
    t.index ["rate_id"], name: "index_rate_values_on_rate_id"
  end

  create_table "rates", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_rates_on_name", unique: true
  end

end

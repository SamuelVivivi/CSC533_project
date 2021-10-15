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

ActiveRecord::Schema.define(version: 2021_09_29_095150) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "name"
    t.string "email_address"
    t.string "password_digest"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email_address"], name: "index_admins_on_email_address", unique: true
  end

  create_table "applicants", force: :cascade do |t|
    t.string "name"
    t.string "email_address"
    t.string "password_digest"
    t.string "phone_number"
    t.integer "property_applied"
    t.integer "property_occupied"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email_address"], name: "index_applicants_on_email_address", unique: true
  end

  create_table "applications", force: :cascade do |t|
    t.string "application_id"
    t.date "datetime"
    t.string "property_name"
    t.integer "approved_rejected_processing"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "applicant_id", null: false
    t.bigint "property_id", null: false
    t.string "applicant_name"
    t.index ["applicant_id"], name: "index_applications_on_applicant_id"
    t.index ["application_id"], name: "index_applications_on_application_id", unique: true
    t.index ["property_id"], name: "index_applications_on_property_id"
  end

  create_table "leasing_agents", force: :cascade do |t|
    t.string "name"
    t.string "email_address"
    t.string "password_digest"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email_address"], name: "index_leasing_agents_on_email_address", unique: true
  end

  create_table "properties", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.integer "size"
    t.boolean "pets_allowed"
    t.boolean "laundry"
    t.boolean "parking"
    t.integer "terms_available"
    t.date "earliest_start_date"
    t.decimal "application_fee"
    t.decimal "monthly_rent"
    t.string "occupied_by"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "waitlists", force: :cascade do |t|
    t.string "applicant_id"
    t.date "datetime"
    t.string "property"
    t.integer "approved_rejected_processing"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["applicant_id"], name: "index_waitlists_on_applicant_id", unique: true
  end

  add_foreign_key "applications", "applicants"
  add_foreign_key "applications", "properties"
end

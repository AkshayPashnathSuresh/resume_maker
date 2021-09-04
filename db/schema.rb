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

ActiveRecord::Schema.define(version: 2021_08_14_022250) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "nationality"
    t.string "province"
    t.string "city"
    t.string "remaining_address"
    t.string "country"
    t.string "post_cd"
    t.string "mail_id"
    t.string "phone_no"
    t.string "linkedIn_url"
    t.string "twitter_url"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_addresses_on_user_id", unique: true
  end

  create_table "educations", force: :cascade do |t|
    t.string "institution_name"
    t.string "course_name"
    t.date "studied_from"
    t.date "studied_to"
    t.string "grade_point"
    t.text "achivements"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "personals", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "area_of_interests"
    t.text "technical_skills"
    t.text "known_languages"
    t.text "personal_profile"
    t.text "carreer_objective"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_personals_on_user_id"
  end

  create_table "resumes", force: :cascade do |t|
    t.string "resume_name"
    t.string "layout_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_resumes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "works", force: :cascade do |t|
    t.string "company_name"
    t.string "designation"
    t.date "work_from"
    t.date "work_to"
    t.text "job_description"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "educations", "users"
  add_foreign_key "personals", "users"
  add_foreign_key "resumes", "users"
  add_foreign_key "works", "users"
end

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

ActiveRecord::Schema[7.0].define(version: 2022_10_25_124346) do
  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "content"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "medical_appointments", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "cp_number"
    t.time "time"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medical_services", force: :cascade do |t|
    t.integer "service_id"
    t.integer "payment_id"
    t.integer "medical_appointment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["medical_appointment_id"], name: "index_medical_services_on_medical_appointment_id"
    t.index ["payment_id"], name: "index_medical_services_on_payment_id"
    t.index ["service_id"], name: "index_medical_services_on_service_id"
  end

  create_table "payments", force: :cascade do |t|
    t.string "method"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_category_ships", force: :cascade do |t|
    t.integer "post_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_post_category_ships_on_category_id"
    t.index ["post_id"], name: "index_post_category_ships_on_post_id"
  end

  create_table "posts", force: :cascade do |t|
    t.string "fname"
    t.string "lname"
    t.string "email"
    t.string "address"
    t.integer "cnum"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "delete_at"
    t.integer "user_id"
    t.integer "comments_count", default: 0
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "services", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

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

ActiveRecord::Schema[7.1].define(version: 2024_06_01_114142) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bike_rides", force: :cascade do |t|
    t.float "kilojoules"
    t.float "total_elevation_gain"
    t.float "distance"
    t.float "average_heartrate"
    t.float "average_watts"
    t.float "moving_time"
    t.float "weighted_average_watts"
    t.float "average_cadence"
    t.float "average_speed"
    t.float "elapsed_time"
    t.float "prediction"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bike_rides_on_user_id"
  end

  create_table "predictions", force: :cascade do |t|
    t.bigint "bike_ride_id", null: false
    t.float "prediction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bike_ride_id"], name: "index_predictions_on_bike_ride_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bike_rides", "users"
  add_foreign_key "predictions", "bike_rides"
end

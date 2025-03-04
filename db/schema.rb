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

ActiveRecord::Schema[8.0].define(version: 2025_03_04_161703) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.bigint "ticket_id", null: false
    t.index ["ticket_id"], name: "index_bookings_on_ticket_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "event_organizers", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "uniq_email_per_event_organizer", unique: true
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.string "description"
    t.string "venue", null: false
    t.datetime "date", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_organizer_id", null: false
    t.index ["event_organizer_id"], name: "index_events_on_event_organizer_id"
  end

  create_table "tickets", force: :cascade do |t|
    t.decimal "price", null: false
    t.string "type", null: false
    t.integer "availability", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id", null: false
    t.integer "remaining", null: false
    t.index ["event_id"], name: "index_tickets_on_event_id"
    t.index ["type", "event_id"], name: "index_tickets_on_type_and_event_id", unique: true
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.index ["email"], name: "uniq_email_per_user", unique: true
  end

  add_foreign_key "bookings", "tickets"
  add_foreign_key "bookings", "users"
  add_foreign_key "events", "event_organizers"
  add_foreign_key "tickets", "events"
end

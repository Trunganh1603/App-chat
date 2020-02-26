# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_02_25_030426) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "channels", force: :cascade do |t|
    t.string "name"
    t.string "messager"
    t.integer "parent_id"
    t.integer "role", default: 0, null: false
    t.integer "status", default: 0, null: false
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_channels_on_parent_id"
    t.index ["user_id"], name: "index_channels_on_user_id"
  end

  create_table "channels_users", force: :cascade do |t|
    t.bigint "channel_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["channel_id"], name: "index_channels_users_on_channel_id"
    t.index ["user_id"], name: "index_channels_users_on_user_id"
  end

  create_table "conversation_images", force: :cascade do |t|
    t.bigint "conversation_id"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["conversation_id"], name: "index_conversation_images_on_conversation_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.string "messenger"
    t.json "image"
    t.integer "role", default: 0, null: false
    t.string "roomable_type"
    t.bigint "roomable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["roomable_type", "roomable_id"], name: "index_conversations_on_roomable_type_and_roomable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.integer "role", default: 0, null: false
    t.string "avatar"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "channels", "users"
  add_foreign_key "channels_users", "channels"
  add_foreign_key "channels_users", "users"
end

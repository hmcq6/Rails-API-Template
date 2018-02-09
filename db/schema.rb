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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180209003351) do

  create_table "brands", force: :cascade do |t|
    t.text "name"
    t.text "nickname"
    t.integer "image_id"
    t.integer "items_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["image_id"], name: "index_brands_on_image_id"
    t.index ["items_id"], name: "index_brands_on_items_id"
  end

  create_table "brands_images", id: false, force: :cascade do |t|
    t.integer "brand_id", null: false
    t.integer "image_id", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
    t.string "hex"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "features", force: :cascade do |t|
    t.string "name"
    t.integer "items_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["items_id"], name: "index_features_on_items_id"
  end

  create_table "features_items", id: false, force: :cascade do |t|
    t.integer "item_id", null: false
    t.integer "feature_id", null: false
    t.index ["feature_id", "item_id"], name: "index_features_items_on_feature_id_and_item_id"
    t.index ["item_id", "feature_id"], name: "index_features_items_on_item_id_and_feature_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "file_name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "item_id"
    t.integer "brand_id"
    t.index ["brand_id"], name: "index_images_on_brand_id"
    t.index ["item_id"], name: "index_images_on_item_id"
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.string "alt_name"
    t.integer "brand_id"
    t.integer "type_id"
    t.integer "year"
    t.integer "product_number"
    t.integer "colors_id"
    t.integer "features_id"
    t.string "bust"
    t.string "length"
    t.integer "price"
    t.string "waist"
    t.string "notes"
    t.integer "tags_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "images_id"
    t.index ["brand_id"], name: "index_items_on_brand_id"
    t.index ["colors_id"], name: "index_items_on_colors_id"
    t.index ["features_id"], name: "index_items_on_features_id"
    t.index ["images_id"], name: "index_items_on_images_id"
    t.index ["tags_id"], name: "index_items_on_tags_id"
    t.index ["type_id"], name: "index_items_on_type_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name"
    t.integer "items_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["items_id"], name: "index_types_on_items_id"
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
    t.string "authentication_token"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end

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

ActiveRecord::Schema[7.1].define(version: 2024_09_07_083854) do
  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commenter"
    t.text "body"
    t.integer "article_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.index ["article_id"], name: "index_comments_on_article_id"
  end

  create_table "messengers", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "to_user_id"
    t.string "status"
    t.boolean "saw_last"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "last_message"
    t.index ["user_id"], name: "index_messengers_on_user_id"
  end

  create_table "private_messages", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "to_user_id"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_private_messages_on_user_id"
  end

  create_table "team_posts", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "user_id"
    t.text "post"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_team_posts_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "title"
    t.integer "owner_id"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_teams", force: :cascade do |t|
    t.integer "team_id", null: false
    t.integer "user_id"
    t.string "status"
    t.datetime "last_message"
    t.boolean "saw_last"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_user_teams_on_team_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.string "password_confirmation"
  end

  add_foreign_key "comments", "articles"
  add_foreign_key "messengers", "users"
  add_foreign_key "private_messages", "users"
  add_foreign_key "team_posts", "teams"
  add_foreign_key "user_teams", "teams"
end

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

ActiveRecord::Schema.define(version: 2019_02_23_203503) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answer_boards", force: :cascade do |t|
    t.bigint "question_board_id"
    t.string "email", null: false
    t.string "name"
    t.string "token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_board_id"], name: "index_answer_boards_on_question_board_id"
    t.index ["token"], name: "index_answer_boards_on_token"
  end

  create_table "answers", force: :cascade do |t|
    t.bigint "answer_board_id"
    t.bigint "question_id"
    t.text "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["answer_board_id"], name: "index_answers_on_answer_board_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "question_boards", force: :cascade do |t|
    t.bigint "user_id"
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_question_boards_on_user_id"
  end

  create_table "questions", force: :cascade do |t|
    t.bigint "question_board_id"
    t.string "content", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_board_id"], name: "index_questions_on_question_board_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "users"
    t.string "provider"
    t.string "uid"
    t.string "token"
    t.string "meta"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "answer_boards", "question_boards"
  add_foreign_key "answers", "answer_boards"
  add_foreign_key "answers", "questions"
  add_foreign_key "question_boards", "users"
  add_foreign_key "questions", "question_boards"
end

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

ActiveRecord::Schema[7.0].define(version: 2023_10_28_191744) do
  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.date "dob"
    t.date "dod"
    t.text "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "authors_books", id: false, force: :cascade do |t|
    t.integer "book_id", null: false
    t.integer "author_id", null: false
    t.index ["author_id", "book_id"], name: "index_authors_books_on_author_id_and_book_id", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.integer "pages"
    t.integer "year"
    t.string "publisher"
    t.decimal "list_price", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "review_authors", force: :cascade do |t|
    t.string "name"
    t.text "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "stars"
    t.text "review"
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "review_author_id", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["review_author_id"], name: "index_reviews_on_review_author_id"
  end

  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "review_authors"
end

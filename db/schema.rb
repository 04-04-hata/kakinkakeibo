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

ActiveRecord::Schema.define(version: 20_211_012_070_126) do
  create_table 'gacha_kakeibos', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'kakeibo_id', null: false
    t.string 'object', null: false
    t.integer 'billing_amount', null: false
    t.integer 'single_gacha', null: false
    t.integer 'ten_combo_gacha', null: false
    t.integer 'total', null: false
    t.boolean 'is_result_status', default: false, null: false
    t.integer 'winning_count', default: 0, null: false
    t.integer 'billing_item', null: false
    t.string 'remarks', default: '', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'kakeibos', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.string 'name', null: false
    t.boolean 'is_kakeibo_status', default: false, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'other_kakeibos', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.integer 'kakeibo_id', null: false
    t.string 'object', null: false
    t.integer 'billing_amount', null: false
    t.string 'remarks', default: '', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.string 'name', default: '', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end

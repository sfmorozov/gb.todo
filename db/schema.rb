# frozen_string_literal: true

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

ActiveRecord::Schema.define(version: 20_220_121_082_427) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'events', comment: 'Перечень событий', force: :cascade do |t|
    t.string 'name', comment: 'Название события'
    t.text 'content', comment: 'Описание события'
    t.boolean 'done', default: false, comment: 'Состояние: завершено-не завершено'
    t.datetime 'finished_at', comment: 'Дата и время завершения'
    t.bigint 'user_id', comment: 'Внешний ключ к таблице Users'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_events_on_user_id'
  end

  create_table 'items', comment: 'Составляющие события', force: :cascade do |t|
    t.string 'name', comment: 'Заголовок'
    t.boolean 'done', default: false, comment: 'Состояние: завершено-не завершено'
    t.datetime 'finished_at', comment: 'Дата и время завершения'
    t.bigint 'events_id', comment: 'Внешний ключ к таблице Events'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['events_id'], name: 'index_items_on_events_id'
  end

  create_table 'roles', comment: 'Роли пользователей', force: :cascade do |t|
    t.string 'name', comment: 'Назввание роли'
    t.string 'code', comment: 'Псевдоним'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'users', comment: 'Пользователь', force: :cascade do |t|
    t.string 'name', comment: 'Имя пользователя для входа'
    t.string 'email', comment: 'Электропочта'
    t.boolean 'active', default: true, comment: 'Пользователь true or false'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.integer 'role_id', comment: 'Роль'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['name'], name: 'index_users_on_name', unique: true
  end

  add_foreign_key 'events', 'users'
  add_foreign_key 'items', 'events', column: 'events_id'
  add_foreign_key 'users', 'roles'
end

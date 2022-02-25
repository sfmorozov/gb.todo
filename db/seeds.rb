# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require_relative '../lib/tasks/settings'

Item.destroy_all
Event.destroy_all
User.destroy_all
Role.destroy_all

# Создаём роли

ROLE_LIST.each_pair do |key, value|
  Role.create name: value, code: key
end

# Создаём пользователей

if Role.all.ids.count.positive?
  USERS.times do
    User.create(
      name: FFaker::NameRU.name,
      email: FFaker::Internet.email,
      role_id: Role.all.ids.sample
    )
  end
else
  (puts 'Сначала нужно заполнить роли: rails db:fill_roles')
end

# Создаём события

if Role.all.ids.count.positive? && User.all.ids.count.positive?
  EVENTS.times do
    Event.create(
      name: FFaker::LoremRU.word,
      content: FFaker::LoremRU.phrase,
      user_id: User.all.ids.sample
    )
  end
else
  (puts 'Сначала нужно заполнить роли: rails db:fill_roles
                    и пользователей rails db:fill_users')
end

# Создаём подпункты

if Event.all.ids.count.positive?
  ITEMS.times do
    Item.create(
      name: FFaker::LoremRU.word,
      event_id: Event.all.ids.sample
    )
  end
else
  (puts 'Events должны быть заполнены rails db:fill_events')
end

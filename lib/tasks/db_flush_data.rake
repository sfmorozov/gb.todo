# frozen_string_literal: true

namespace :db do
  desc 'Удаляем данные из таблиц'
  task flush: :environment do
    Item.destroy_all
    Event.destroy_all
    User.destroy_all
    Role.destroy_all
  end
end

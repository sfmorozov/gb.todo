# frozen_string_literal: true

namespace :db do
  desc 'Заполнение базы данных тестовыми данными'
  task fill_data: %i[fill_roles
                     fill_users
                     fill_events
                     fill_items]
end

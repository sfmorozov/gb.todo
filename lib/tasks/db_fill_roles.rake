# frozen_string_literal: true

require_relative 'settings'
namespace :db do
  desc 'Заполнение таблицы ролей из файла setings'
  task fill_roles: :environment do
    ROLE_LIST.each_pair do |key, value|
      Role.create name: value, code: key
    end
  end
end

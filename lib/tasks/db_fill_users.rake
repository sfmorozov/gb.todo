# frozen_string_literal: true

require_relative 'settings'
namespace :db do
  desc 'Заполнение таблицы пользователей тестовыми данными rails db:fill_users [Число экземпляров пользователей])'
  task :fill_users, [:params] => :environment do |_t, args|
    args.with_defaults(params: USERS)
    if Role.all.ids.count.positive?
      args.params.to_i.times do
        User.create(
          name: FFaker::NameRU.name,
          email: FFaker::Internet.email,
          role_id: Role.all.ids.sample(1)[0]
        )
      end
    else
      (puts 'Сначала нужно заполнить роли: rails db:fill_roles')
    end
  end
end

# frozen_string_literal: true

require_relative 'settings'
namespace :db do
  desc 'Заполнение таблицы событий тестовыми данными rails db:fill_events [Число экземпляров событий])'
  task :fill_events, [:params] => :environment do |_t, args|
    args.with_defaults(params: EVENTS)
    if Role.all.ids.count.positive? && User.all.ids.count.positive?
      args.params.to_i.times do
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
  end
end

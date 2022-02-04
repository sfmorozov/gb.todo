# frozen_string_literal: true

require_relative 'settings'
namespace :db do
  desc 'Заполнение таблицы подпунктов тестовыми данными rails db:fill_items [Число экземпляров подпунктов])'
  task :fill_items, [:params] => :environment do |_t, args|
    args.with_defaults(params: ITEMS)
    if Event.all.ids.count.positive?
      args.params.to_i.times do
        Item.create(
          name: FFaker::LoremRU.word,
          events_id: Event.all.ids.sample(1)[0]
        )
      end
    else
      (puts 'Events должны быть заполнены rails db:fill_events')
    end
  end
end

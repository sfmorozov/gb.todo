# frozen_string_literal: true

namespace :events do
  desc 'Статистика в разрезе пользователей-задач'
  task	status: :environment do
    User.order(:name).each do |user|
      puts format(
        '%20s: % 3d % 3d',
        user.name,
        Event.where(user_id: user.id).count,
        Item.where(
          events_id:
             Event.where(user_id: user.id).ids
        ).count
      )
    end
  end
end

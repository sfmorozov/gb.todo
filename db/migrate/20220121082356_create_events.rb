# frozen_string_literal: true

class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events, comment: 'Перечень событий' do |t|
      t.string :name, comment: 'Название события'
      t.text :content, comment: 'Описание события'
      t.boolean :done, default: false, comment: 'Состояние: завершено-не завершено'
      t.datetime :finished_at, comment: 'Дата и время завершения'
      t.references :user, foreign_key: true,
                          comment: 'Внешний ключ к таблице Users'

      t.timestamps
    end
  end
end

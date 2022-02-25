# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items, comment: 'Составляющие события' do |t|
      t.string :name, comment: 'Заголовок'
      t.boolean :done, default: false,
                       comment: 'Состояние: завершено-не завершено'
      t.datetime :finished_at, comment: 'Дата и время завершения'
      t.references :event, foreign_key: true,
                            comment: 'Внешний ключ к таблице Events'

      t.timestamps
    end
  end
end

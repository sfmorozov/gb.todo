# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, comment: 'Пользователь' do |t|
      t.with_options index: { unique: true } do
        string :name, comment: 'Имя пользователя для входа'
        string :email, comment: 'Электропочта'
      end
      t.boolean :active,
                default: true,
                comment: 'Пользователь true or false'

      t.timestamps
    end
  end
end

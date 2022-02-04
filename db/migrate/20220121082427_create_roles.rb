# frozen_string_literal: true

class CreateRoles < ActiveRecord::Migration[6.1]
  def change
    create_table :roles, comment: 'Роли пользователей' do |t|
      t.string :name, comment: 'Назввание роли'
      t.string :code, comment: 'Псевдоним'

      t.timestamps
    end

    add_column :users, :role_id, :integer, comment: 'Роль'
    add_foreign_key :users, :roles
  end
end

# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, :email, :role_id, presence: true
  validates :name, length: { maximum: 16, minimum: 2 }
  validates :name, uniqueness: true

  # belongs_to :role
end

# frozen_string_literal: true

class User < ApplicationRecord
  belongs_to :role
  has_many :events

  validates :name, :email, :role_id, presence: true
  validates :name, length: { maximum: 16, minimum: 2 }
  validates :name, uniqueness: true

end

# frozen_string_literal: true

class Role < ApplicationRecord
  has_many :users

  validates :name, :code, presence: true
  validates :name, :code, length: { maximum: 16, minimum: 4 }
  validates :name, :code, uniqueness: true
end

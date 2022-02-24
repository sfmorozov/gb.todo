# frozen_string_literal: true

class Item < ApplicationRecord
  validates :name, presence: true
  validates :name, length: { minimum: 4 }

  # belongs_to :event
end

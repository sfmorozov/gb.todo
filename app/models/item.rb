# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :name, length: { minimum: 4 }

end

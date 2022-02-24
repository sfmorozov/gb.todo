# frozen_string_literal: true

class Event < ApplicationRecord
  validates :name, :content, presence: true

  # belongs_to :user
end

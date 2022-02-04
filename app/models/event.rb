# frozen_string_literal: true

class Event < ApplicationRecord
  validates :name, :content, presence: true
end

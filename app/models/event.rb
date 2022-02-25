# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :user
  has_many :items

  validates :name, :content, presence: true
end

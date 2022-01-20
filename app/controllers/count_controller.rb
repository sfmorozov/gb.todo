# frozen_string_literal: true

class CountController < ApplicationController
  @@collect = {}

  def show
    Rails.logger.info '#########################################'
    id = session[:session_id].to_sym
    if @@collect.key?(id)
      @@collect.store(id, @@collect[id] + 1)
    else
      @@collect.store(id, 1)
    end
    puts @@collect
    @val = @@collect
    Rails.logger.info '#########################################'
  end
end

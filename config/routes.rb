Rails.application.routes.draw do
  get 'help', to: 'help#index', as: 'help_index'
  get 'about', to: 'about#index', as: 'about_index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'events#index'
end

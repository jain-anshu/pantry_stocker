# frozen_string_literal: true

Rails.application.routes.draw do
  #get 'home/index'
  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations',
    passwords: 'devise/passwords'
  }

  # Defines the root path route ("/")
  root to: "ingredients#index"

  resources :stores
  resources :ingredients
  get '/need_to_buy', to: 'ingredients#need_to_buy'
  get '/basic_ingredients', to: 'ingredients#basic_ingredients'
end

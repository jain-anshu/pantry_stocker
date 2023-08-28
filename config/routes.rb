# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :stores
  resources :ingredients
  get '/ingredients_running_low', to: 'ingredients#ingredients_running_low'
  get '/basic_ingredients', to: 'ingredients#basic_ingredients'
end

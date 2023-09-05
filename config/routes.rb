# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, path: 'auth', controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations',
  passwords: 'users/passwords'
}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"

  resources :users
  resources :stores
  resources :ingredients
  get '/need_to_buy', to: 'ingredients#need_to_buy'
  get '/basic_ingredients', to: 'ingredients#basic_ingredients'
end

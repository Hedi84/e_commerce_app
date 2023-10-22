# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # Home
  root 'items#index'

  # items
  resources :items, only: %i[index show]

  # carts
  resources :carts, only: [:show]

  # checkouts
  resources :checkouts, only: %i[show update]

  # cart_items
  post '/cart_items/:item_id', to: 'cart_items#create', as: 'add_to_cart'
  delete 'cart_items/:id', to: 'cart_items#destroy', as: 'remove_cart_item'
end

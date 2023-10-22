# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # Home
  root "items#index"

  # items
  resources :items

  # carts
  resources :carts

  # checkouts
  resources :checkouts, only: [:show, :destroy]

  # cart_items
  resources :cart_items
  post "/cart_items/:item_id", to: "cart_items#create", as: "add_to_cart"
end
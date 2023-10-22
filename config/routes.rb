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
  resources :cart_items, except: [:create, :destroy, :show]
  post "/cart_items/:item_id", to: "cart_items#create", as: "add_to_cart"
  delete "cart_items/:id", to: "cart_items#destroy", as: "remove_cart_item"
end
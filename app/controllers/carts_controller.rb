# frozen_string_literal: true

# app/controllers/carts_controller.rb
class CartsController < ApplicationController
  before_action :find_cart, :find_checkout

  def show
    cart_items
  end

  private

  def find_cart
    @cart ||= Cart.where(user_id: current_user.id, active: true).last
  end

  def cart_items
    @cart_items ||= @cart.cart_items
  end

  def find_checkout
    # finds the corresponding checkout or creates a new one
    @checkout ||= Checkout.find_or_create_by(cart_id: @cart.id)
  end
end

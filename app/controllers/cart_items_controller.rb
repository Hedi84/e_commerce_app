# frozen_string_literal: true

# app/controllers/cart_items_controller.rb
class CartItemsController < ApplicationController
  before_action :find_cart_item, only: [:destroy]

  def create
    # moving an item into the cart creates a cart_item
    # fetch a user's last active cart or create a new one
    @cart_item = CartItem.new(item_id:, cart_id: cart.id)
    @cart_item.save
    redirect_to cart_path(@cart_item.cart)
  end

  def destroy
    @cart_item.delete
    redirect_to cart_path(cart.id)
  end

  private

  def item_id
    @item_id = params[:item_id]
  end

  def find_cart_item
    CartItem.find(params[:id])
  end

  def cart
    @cart ||= Cart.find_or_create_by(user_id: current_user.id, active: true)
  end
end

# frozen_string_literal: true

# app/controllers/checkouts_controller.rb
class CheckoutsController < ApplicationController
  before_action :find_checkout

  def show
    cart
  end

  def update
    # paying and checking out updates both checkout and cart
    @checkout.paid = true
    cart.active = false
    if @checkout.save && cart.save
      flash[:notice] = 'Thank you for your purchase'
      redirect_to root_path
    else
      flash[:error] = 'Something went wrong, please contact an admin'
      render checkout_path(@checkout)
    end
  end

  private

  def find_checkout
    @checkout ||= Checkout.find(params[:id])
  end

  def cart
    @cart ||= @checkout.cart
  end
end

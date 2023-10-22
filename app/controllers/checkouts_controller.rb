class CheckoutsController < ApplicationController
    before_action :find_checkout

    def show
      cart
    end

    def update
      @checkout.paid = true
      cart.active = false
      if @checkout.save && cart.save
        redirect_to root_path
      else
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
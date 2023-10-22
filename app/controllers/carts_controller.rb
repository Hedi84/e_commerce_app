class CartsController < ApplicationController
    before_action :find_cart, only: [:show, :update, :delete]

    def create
        @cart = Cart.create(cart_params)
        Checkout.create(user: current_user, cart: @cart)
        redirect_to cart_path(@cart)
    end

    def show
       cart_items
    end

    def delete
        @cart.delete
        redirect_to root_path
    end

    private

    def find_cart
        @cart ||= Cart.find_by(user_id: current_user.id)
    end

    def cart_params
        params.require(:cart).permit(:user_id, checkout_id)
    end

    def cart_items
        @cart_items ||= @cart.cart_items
    end
end

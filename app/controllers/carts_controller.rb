class CartsController < ApplicationController
    def show
       find_cart
       cart_items
    end

    private

    def find_cart
        @cart ||= Cart.where(user_id: current_user.id, active: true).last
    end

    def cart_items
        @cart_items ||= @cart.cart_items
    end
end

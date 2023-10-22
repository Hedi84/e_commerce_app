class CheckoutsController < ApplicationController
    before_action :find_checkout, only: [:show, :destroy]

    def show
        @checkout.calculate_total
        basket
    end

    def destroy
        @checkout.destroy
        redirect_to root_path
    end

    private

    def find_checkout
        @checkout ||= Cart.where(user_id: current_user.id).first.checkout
    end
    def cart
        @cart ||= @checkout.cart
    end

    def cart_items
        @cart_items ||= cart.cart_items
    end
end
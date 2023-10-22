class CartItemsController < ApplicationController
    before_action :find_cart_item, only: [:destroy]

    def create
        # moving an item into the cart creates a cart_item
        @cart_item = CartItem.new(item_id: item_id, cart_id: cart_id)
        @cart_item.save
        redirect_to cart_path(@cart_item.cart)
    end

    def destroy
        @cart_item.delete
        redirect_to cart_path(cart_id)
    end

    private

    def item_id
        @item_id = params[:item_id]
    end

    def find_cart_item
        @cart_item ||= CartItem.find(params[:id])
    end

    def cart_id
        # fetch a user's last cart or create a new one if that one is paid
        @cart ||=
            last_unpaid_cart&.id || new_cart.id
    end

    def checkout
        @checkout ||= Checkout.create
    end

    def new_cart
        Cart.create(user_id: current_user.id, checkout: checkout)
    end

    def last_unpaid_cart 
       # return the last cart only if it is active
        return unless last_cart&.active
        last_cart
    end

    def last_cart
        @last_cart ||= Cart.where(user_id: current_user.id).last
    end
end

class CartItemsController < ApplicationController
    before_action :find_cart_item, only: [:show, :destroy]

    def create
        @cart_item = CartItem.new(item_id: item_id, cart_id: cart_id)
        @cart_item.save
        redirect_to cart_path(@cart_item.cart)
    end

    def destroy
        @cart_item.delete
        redirect_to root_path
    end

    private

    def item_id
        @item_id = params[:item_id]
    end

    def find_cart_item
        @cart_item ||= CartItem.find(params[:id])
    end

    def cart_id
        @cart ||=
            Cart.where(user_id: current_user.id).first&.id || Cart.create(user_id: current_user.id, checkout: checkout).id
    end

    def checkout
        @checkout ||= Checkout.create
    end
end

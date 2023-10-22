class ItemsController < ApplicationController
    before_action :find_item, only: [:show, :edit, :update, :delete]
    skip_before_action :authenticate_user!, only: [:index, :show]

    def index
        @items = Item.all
        @cart_id = cart_id
    end

    def show
    end

    def new
        @item = Item.new
    end

    def create
        @item = Item.create(item_params)
        redirect_to item_path(@item.id)
    end

    def delete
        @item.delete
    end

    def edit
    end

    def update
        @item.update(item_params)
        redirect_to item_path(@item.id)
    end

    private

    def find_item
        @item ||= Item.find(params[:id])
    end

    def item_params
        params.require(:item).permit(:name, :price, :description)
    end

    def cart_id
        @cart_id ||= Cart.where(user_id: current_user&.id).last
    end
end
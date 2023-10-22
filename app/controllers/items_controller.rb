# frozen_string_literal: true

# app/controllers/items_controller.rb
class ItemsController < ApplicationController
  before_action :find_item, only: [:show]
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @items = Item.all
    @cart_id = cart_id
  end

  def show; end

  private

  def find_item
    @item ||= Item.find(params[:id])
  end

  def cart_id
    # for simplicity's sake always user a user's latest active cart
    @cart_id ||= Cart.where(user_id: current_user&.id, active: true).last
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CartItems', type: :request do
  let(:user) { User.create(email: 'user@email.com', password: 'password123') }
  let(:name) { 'Office Desk' }
  let(:description) { 'A comfortable desk at exactly the right height' }
  let(:item) { Item.create(name:, description:, price: 50) }
  let(:cart) { Cart.create(user_id: user.id) }
  let!(:cart_item) { CartItem.create(cart_id: cart.id, item_id: item.id) }

  describe "DELETE 'cart_item/:id'" do
    it 'allows the user to remove a cart item' do
      sign_in user
      expect(cart.cart_items.count).to eq(1)
      delete remove_cart_item_path(cart_item.id)
      expect(response).to have_http_status(:found)
      expect(cart.cart_items.count).to eq(0)
    end
  end

  describe "CREATE 'cart_item'" do
    before { allow(Cart).to receive(:find_or_create_by).and_return(cart) }

    it 'allows the user to move an item in the cart' do
      sign_in user
      expect(cart.cart_items.count).to eq(1)
      post add_to_cart_path(item_id: item.id)
      expect(cart.cart_items.count).to eq(2)
    end
  end
end

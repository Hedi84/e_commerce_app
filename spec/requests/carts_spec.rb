# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Carts', type: :request do
  let(:user) { User.create(email: 'user@email.com', password: 'password123') }
  let(:name) { 'Office Desk' }
  let(:description) { 'A comfortable desk at exactly the right height' }
  let(:item) { Item.create(name:, description:, price: 50) }
  let(:cart) { Cart.create(user_id: user.id) }
  let(:cart_item) { CartItem.create(cart_id: cart.id, item_id: item.id) }

  describe 'GET /cart/:id' do
    it 'returns the cart show page' do
      cart_item
      sign_in user
      get item_path(cart.id)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(name)
    end
  end
end

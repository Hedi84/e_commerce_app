# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Checkouts', type: :request do
  let(:user) { User.create(email: 'user@email.com', password: 'password123') }
  let(:name) { 'Office Desk' }
  let(:description) { 'A comfortable desk at exactly the right height' }
  let(:item) { Item.create(name:, description:, price: 50) }
  let(:cart) { Cart.create(user_id: user.id) }
  let!(:cart_item) { CartItem.create(cart_id: cart.id, item_id: item.id) }
  let(:checkout) { Checkout.create(cart_id: cart.id) }

  describe 'GET /checkout/:id' do
    it 'returns the checkout show page' do
      sign_in user
      get checkout_path(checkout.id)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(name)
      expect(response.body).to include('50')
      expect(response.body).to include('Pay and order')
    end
  end

  describe "PUT 'checkout/:id'" do
    it 'allows the user to pay and order' do
      expect(checkout.paid).to eq(false)
      expect(cart.active).to eq(true)
      sign_in user
      put checkout_path(checkout.id)
      expect(response).to have_http_status(:found)
      checkout.reload && cart.reload
      expect(checkout.paid).to eq(true)
      expect(cart.active).to eq(false)
    end
  end
end

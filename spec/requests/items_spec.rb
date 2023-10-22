# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Items', type: :request do
  let(:name) { 'Office Desk' }
  let(:description) { 'A comfortable desk at exactly the right height' }
  let(:item) { Item.create(name:, description:, price: 50) }

  describe 'GET /items' do
    it 'returns the index' do
      item
      get items_path
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('check out Office Desk')
    end
  end

  describe 'GET /item/:id' do
    it 'returns the item show page' do
      get item_path(item.id)
      expect(response).to have_http_status(:ok)
      expect(response.body).to include(name)
      expect(response.body).to include(description)
    end
  end
end

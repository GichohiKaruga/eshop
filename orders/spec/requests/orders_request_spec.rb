require 'rails_helper'

RSpec.describe 'Orders API', type: :request do

  describe 'GET /api/v1/orders' do
    before do
      FactoryBot.create(:order)
    end
    it 'return all orders' do
      get '/api/v1/orders'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'POST /api/v1/orders' do
    it 'create a new order' do
      order_params = { status: 'Pending', amount: 345.45, customer: { id: 2, name: 'Mtu Muzito' },
                       order_detail: { id: 3545, quantity: 3, name: 'Nike VaporFly', price: 453.49 } }
      expect do
        post '/api/v1/orders', params: order_params.to_json, headers: { "Content-Type": 'application/json' }
      end.to change { Order.count }.from(0).to(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'GET an order by id' do
    let!(:order) { FactoryBot.create(:order) }
    it 'return an order' do
      get "/api/v1/orders/#{order.id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to be > 0
    end
  end

end
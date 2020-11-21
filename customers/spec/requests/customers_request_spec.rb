require 'rails_helper'

describe 'CustomersRequest', type: :request do

  describe 'GET /customers' do
    before do
      FactoryBot.create(:customer)
    end
    it 'return all customers' do
      get '/api/v1/customers'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'POST /api/v1/customers' do
    it 'create a new customer' do
      customer_params = { username: 'gichohi@karuga.net', firstname: 'Gichohi', lastname: 'Karuga',
                          email: 'gichohi@karuga.net', password: 's3cr3t', address: '32 state house road'}
      expect do
        post '/api/v1/customers', params: customer_params.to_json, headers: { "Content-Type": 'application/json' }
      end.to change { Customer.count }.from(0).to(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'GET a customer by id' do
    let!(:customer) { FactoryBot.create(:customer) }
    it 'return a customer' do
      get "/api/v1/customers/#{customer.id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to be > 0
    end
  end
end
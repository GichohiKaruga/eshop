require 'rails_helper'

describe 'Products API', type: :request do

  describe 'GET /products' do
    before do
      FactoryBot.create(:product)
    end
    it 'return all products' do
      get '/api/v1/products'
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'POST /products' do
    it 'create a new product' do
      expect do
        post '/api/v1/products', params: {
          product: { name: 'Xiaomi Redmi Note 9', description: 'Premiering processor.', price: 229.95 }
        }
      end.to change { Product.count }.from(0).to(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'GET a product by id' do
    let!(:product) { FactoryBot.create(:product) }
    it 'return a product' do
      get "/api/v1/products/#{product.id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

end


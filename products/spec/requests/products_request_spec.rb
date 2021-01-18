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

  describe 'GET a product by id' do
    let!(:product) { FactoryBot.create(:product) }
    it 'return a product' do
      get "/api/v1/products/#{product.id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

end


require 'rails_helper'

RSpec.describe 'Categories API', type: :request do

  describe 'GET /category' do
    before do
      FactoryBot.create(:category)
    end
    it 'return all products' do
      get '/api/v1/category'

      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body).size).to eq(1)
    end
  end

  describe 'POST /category' do
    it 'create a new category' do
      expect do
        post '/api/v1/category', params: {
          category: { name: 'Sporting', description: 'Clothing, Shoes and accessories' }
        }
      end.to change { Category.count }.from(0).to(1)
      expect(response).to have_http_status(:created)
    end
  end

  describe 'GET a category by id' do
    let!(:category) { FactoryBot.create(:category) }
    it 'return a category' do
      get "/api/v1/category/#{category.id}"
      expect(response).to have_http_status(:success)
      expect(JSON.parse(response.body)).to eq(
        {
          'id' => category.id,
          'name' => 'Electronics',
          'description' => 'TVs, Cameras and Home Audio'

        }
      )
    end
  end

end

require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Book validations' do
    category = Category.new(name: 'Sporting', description: 'Clothing, shoes and accessories')
    product_factory = ProductFactory.new
    product = product_factory.create(category.id, 'Nike ZoomX Vaporfly', 'Great shoes', 34.99)

    it 'should have name' do
      product.name = nil
      expect(product).to_not be_valid
    end
    it 'should have description' do
      product.name = nil
      expect(product).to_not be_valid
    end
    it 'should have price' do
      product.price = nil
      expect(product).to_not be_valid
    end
    it 'should have image' do
      product.image = nil
      expect(product).to_not be_valid
    end
  end

end

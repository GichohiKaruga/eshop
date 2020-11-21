require 'rails_helper'

RSpec.describe Category, type: :model do

  describe 'Category validations' do
    subject { Category.new(name: 'Sporting', description: 'Clothing, shoes and accessories') }

    it 'should have name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
    it 'should have description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end
  end
end

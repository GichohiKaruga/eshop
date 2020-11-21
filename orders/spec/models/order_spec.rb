require 'rails_helper'

RSpec.describe Order, type: :model do

  describe 'Order validations' do
    subject {
      Order.new(status: 'Pending', amount: 354.66, customer: { id: 2, name: 'Mtu Muzito'},
                order_detail: { id: 3545, quantity: 3, name: 'Nike VaporFly', price: 453.49}) }

    it 'should have name' do
      subject.status = nil
      expect(subject).to_not be_valid
    end
    it 'should have amount' do
      subject.amount = nil
      expect(subject).to_not be_valid
    end
  end
end


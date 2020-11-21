require 'rails_helper'

RSpec.describe Customer, type: :model do

  describe 'Customer validations' do
    subject {
      Customer.new(username: 'gichohi@karuga.net', firstname: 'Gichohi', lastname: 'Karuga', email: 'gichohi@karuga.net',
                   address: '43 State house road', password: 's3cr3t') }

    it 'should have first name' do
      subject.firstname = nil
      expect(subject).to_not be_valid
    end
    it 'should have last name' do
      subject.lastname = nil
      expect(subject).to_not be_valid
    end

    it 'should have email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'should have address' do
      subject.address = nil
      expect(subject).to_not be_valid
    end

    it 'should have password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end
  end

end
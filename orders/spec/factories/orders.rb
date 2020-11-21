FactoryBot.define do
  factory :order do
    amount { 354.5 }
    status { 'Pending' }
    customer { { id: 2, name: 'Marie Curie' } }
    order_detail { [{ id:34, name: 'Nike VaporFy', quantity:3, price: 344.55 }] }
  end
end

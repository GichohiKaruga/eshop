FactoryBot.define do
  factory :customer do
    username { 'gichohi@karuga.net' }
    firstname { 'Gichohi' }
    lastname { 'Karuga' }
    email { 'gichohi@karuga.net' }
    address { '45 Muthangari Road'}
    password { 'v3ryB1gs3ecr3t'}
  end
end

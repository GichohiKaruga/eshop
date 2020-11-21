FactoryBot.define do
  factory :product do
    name { 'Xiaomi Redmi Note 9' }
    description { 'Premiering processor, powerful performance.' }
    price { 229.95 }
    image do
      image_path = "#{::Rails.root}/storage/defaults/probook.jpg"
      {
        io: File.open(image_path),
        filename: 'probook.jpg',
        content_type: 'image/jpeg'
      }
    end
    category
  end
end


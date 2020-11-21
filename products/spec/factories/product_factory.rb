class ProductFactory

  def create(category_id, name, description, price, image: getImage)
    Product.create(
      category_id: category_id,
      name: name,
      description: description,
      price: price,
      image: image
    )
  end

  private

  def getImage
    image_path = "#{::Rails.root}/storage/defaults/probook.jpg"
    {
      io: File.open(image_path),
      filename: 'probook.jpg',
      content_type: 'image/jpeg'
    }
  end
end

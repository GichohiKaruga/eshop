module Api
  module V1
    class ProductImageSerializer


      def initialize(product:)
        @product = product
        id = @product.category_id
        @category = Category.find(id)
      end

      def serialize_new_product
        serialized_new_post = serialize_product(@product, @category)
        serialized_new_post.to_json
      end

      private

      def serialize_product(product, category)
        {
          id: product.id,
          image_url: product.get_image_url,
          name: product.name,
          description: product.description,
          price: product.price,
          category: {
            id: product.category_id,
            name: category.name,
            description: category.description
          }
        }
      end

    end
  end
end

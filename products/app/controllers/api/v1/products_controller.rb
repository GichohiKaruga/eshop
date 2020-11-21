module Api
  module V1
    class ProductsController < ApplicationController
      def index
        @products = Product.all
        render json: @products
      end

      def create
        product = Product.create!(product_params)
        if product.save
          render json: product, status: :created
        else
          render json: product, status: :unprocessable_entity
        end
      end

      def show
        @product = Product.find(params[:id])
        product_serializer = ProductImageSerializer.new(product: @product)
        render json: product_serializer.serialize_new_product
      end

      def destroy
        product = Product.find(params[:id])
        if product.destroy
          render json: { 'code': 200, 'message': 'product removed from database' }, status: :ok
        else
          render json: { 'code': 205, 'message': 'product removal failed' }, status: :unprocessable_entity
        end
      end

      private

      def product_params
        params.permit(:name, :description, :price, :category_id, :image)
      end
    end
  end
end

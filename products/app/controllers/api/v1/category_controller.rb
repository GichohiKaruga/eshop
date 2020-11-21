module Api
  module V1
    class CategoryController < ApplicationController
      def index
        @categories = Category.all
        render json: @categories
      end

      def create
        category = Category.create!(category_params)
        if category.save
          render json: category, status: :created
        else
          render json: category, status: :unprocessable_entity
        end
      end

      def show
        @category = Category.find(params[:id])
        render json: @category
      end

      def destroy
        category = Category.find(params[:id])
        if category.destroy
          render json: { 'code': 200, 'message': 'category removed from database' }, status: :ok
        else
          render json: { 'code': 205, 'message': 'category removal failed' }, status: :unprocessable_entity
        end
      end

      def update
        category = Category.find(params[:id])
        category.assign_attributes(category_params)
        if category.save
          response = Response.new(200, 'Category updated successfully')
          render json: response, status: :ok
        else
          render json: category, status: :unprocessable_entity
        end
      end

      private

      def category_params
        params.require(:category).permit(:name, :description)
      end
    end
  end
end

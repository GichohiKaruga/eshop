module Api
  module V1
    class OrdersController < ApplicationController

      def index
        @orders = Order.all
        render json: @orders
      end

      def show
        @order = Order.find(params[:id])
        render json: @order
      end

      def create
        order = Order.create!(order_params)
        if order.save
          render json: order, status: :created
        else
          render json: order, status: :unprocessable_entity
        end
      end

      private

      def order_params
        params.permit(:status, :amount,
                      customer: %i[
                    id
                    name
                  ],
                      order_detail: %i[
                    id
                    name
                    quantity
                    price
                  ]
        )
      end
    end
  end
end

module Api
  module V1
    class CustomersController < ApplicationController
      before_action :authorized, only: [:auto_login]

      def find_all
        @customers = Customer.all
        render json: @customers
      end

      # REGISTER
      def create
        @customer = Customer.create(customer_params)
        if @customer.valid?
          token = encode_token({customer_id: @customer.id})
          render json: {customer: @customer, token: token}, status: :created
        else
          render json: {'code': 205, 'message': 'Record cannot be created'}, status: :unprocessable_entity
        end
      end

      # LOGGING IN
      def login
        @customer = Customer.find_by(username: params[:username])

        if @customer&.authenticate(params[:password])
          token = encode_token({customer_id: @customer.id})
          render json: {customer: @customer, token: token}, status: :ok
        else
          render json: {'code': 205, 'message': 'Invalid username or password'}, status: :unprocessable_entity
        end
      end

      def find_by_id
        @customer = Customer.find(params[:id])
        render json: @customer, status: :ok
      end

      def find_by_username
        @customer = Customer.find_by(username: params[:username])
        render json: @customer, status: :ok
      end

      def destroy
        customer = Customer.find(params[:id])
        if customer.destroy
          render json: {'code': 200, 'message': 'customer removed from database'}, status: :ok
        else
          render json: {'code': 205, 'message': 'customer removal failed'}, status: :unprocessable_entity
        end
      end

      def update
        customer = Customer.find(params[:id])
        customer.assign_attributes(customer_params)
        if customer.save
          response = Response.new(200, 'Customer updated successfully')
          render json: response, status: :ok
        else
          render json: customer, status: :unprocessable_entity
        end
      end

      def auto_login
        render json: @customer
      end

      private

      def customer_params
        params.permit(:username, :password, :email, :firstname, :lastname, :address)
      end
    end
  end
end

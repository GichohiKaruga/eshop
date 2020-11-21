module Api
  module V1
    class CustomerSerializer < ActiveModel::Serializer
      attributes :id, :firstname, :lastname, :email, :address
    end
  end
end
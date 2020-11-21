module Api
  module V1
    class CategorySerializer < ActiveModel::Serializer
      attributes :id, :name, :description
    end
  end
end
class Order < ApplicationRecord
  validates :status, presence: true
  validates :amount, presence: true
  validates :customer, presence: true
  validates :order_detail, presence: true
end

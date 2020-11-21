class Customer < ApplicationRecord
  has_secure_password
  validates :username, presence: true
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :email, presence: true
  validates :email, presence: true
  validates :address, presence: true
  validates :password, presence: true
end

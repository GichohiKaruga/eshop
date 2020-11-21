
class Product < ApplicationRecord
  include Rails.application.routes.url_helpers
  has_one_attached :image

  validates :name, presence: true, length: { maximum: 255 }
  validates :description, presence: true
  validates :image, presence: true
  belongs_to :category

  def get_image_url
    url_for(image)
  end

end


class Product < ApplicationRecord
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_one_attached :image
end

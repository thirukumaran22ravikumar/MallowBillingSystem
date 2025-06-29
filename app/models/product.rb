class Product < ApplicationRecord
	validates :name, presence: true
  	validates :product_id, presence: true, uniqueness: true
  	validates :available_stocks, numericality: { greater_than_or_equal_to: 0 }
  	validates :price, numericality: { greater_than_or_equal_to: 0 }
  	validates :tax_percentage, numericality: { greater_than_or_equal_to: 0 }
end

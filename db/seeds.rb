# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Product.create([
  { name: "Product A", product_id: "PA001", available_stocks: 100, price: 50.0, tax_percentage: 5.0 },
  { name: "Product B", product_id: "PB001", available_stocks: 50, price: 30.0, tax_percentage: 12.0 }
])

Denomination.create([
  { value: 2000, count: 10 },
  { value: 500, count: 20 },
  { value: 200, count: 50 },
  { value: 100, count: 100 },
  { value: 50, count: 200 },
  { value: 20, count: 300 },
  { value: 10, count: 500 },
  { value: 5, count: 1000 },
  { value: 2, count: 1000 },
  { value: 1, count: 1000 }
])

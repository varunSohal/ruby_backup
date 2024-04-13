# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

# 50.times do |p|
#   Product.create(
#     name: Faker::Lorem.word,
#     desc: Faker::Lorem.sentence
#   )
# end

# seeds.rb

# db/seeds.rb

# Define an array of Canadian province names
# provinces = [
#   "Alberta", "British Columbia", "Manitoba", "New Brunswick", "Newfoundland and Labrador",
#   "Nova Scotia", "Ontario", "Prince Edward Island", "Quebec", "Saskatchewan"
# ]

# Loop through the array and create Province records
# provinces.each do |province_name|
#   Province.find_or_create_by(name: province_name)
# end

# db/seeds.rb
# db/seeds.rb








# Clear existing data
Product.destroy_all
Category.destroy_all

# Create categories
categories = ['Shirts', 'T-Shirts', 'Pants', 'Bags']

categories.each do |category_name|
  Category.create(name: category_name)
end

# Populate products with random category_id
categories.each do |category|
  200.times do
    Product.create(
      name: Faker::Commerce.product_name,
      price: Faker::Commerce.price(range: 10.0..1000.0),
      desc: Faker::Lorem.paragraph,
      category_id: Category.pluck(:id).sample
    )
  end
end

puts "Seed data generated successfully!"

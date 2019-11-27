# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# frozen_string_literal: true

OrderItem.destroy_all
Order.destroy_all
ProductVariant.destroy_all
ProductCategory.destroy_all
Category.destroy_all
Product.destroy_all
Page.destroy_all
PRODUCTS_COUNT = 100

MAX_CATEGORIES = 3
MAX_VARIANTS = 4
VARIANTS_WEIGHT = 0.53

Page.create(title: 'About Us', content: 'Please fill this in.', permalink: 'about_us')
Page.create(title: 'Contact Us', content: 'Please fill this in.', permalink: 'contact_us')

CATEGORIES = Faker::Base.fetch_all('commerce.department').map do |title|
  Category.find_or_create_by!(title: title)
end
count = 0
PRODUCTS_COUNT.times do
  title = ''

  # generate unique title
  loop do
    title = Faker::Commerce.product_name
    break unless Product.exists?(title: title)
  end

  product = Product.new(
    title: title,
    description: Faker::Quote.yoda,
    price: Faker::Commerce.price,
    stock_quantity: rand(1..50).to_i
  )

  num_categories = 1 + rand(MAX_CATEGORIES)
  product.categories = CATEGORIES.sample(num_categories)

  if rand > VARIANTS_WEIGHT
    num_variants = 1 + rand(MAX_VARIANTS)
    num_variants.times do
      product.variants.build(
        title: rand > VARIANTS_WEIGHT ? Faker::Commerce.color : Faker::Commerce.material,
        price: Faker::Commerce.price
      )
    end
  end

  product.save!
  count += 1
end

puts "Created #{Category.count} Categories."
puts "Created #{Product.count} Products."

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

all_prod = Product.all

all_prod.each(&:save)

# AdminUser.create!(
#   email:                 "adam@lukowski.com",
#   password:              "password",
#   password_confirmation: "password"
#                   ) if Rails.env.development?

# require "uri"

# Category.delete_all
# Product.delete_all

# categories = [
#   "Espresso Roast",
#   "Light Roast",
#   "Medium Roast",
#   "Dark Roast",
#   "Decaf"
# ]

# gear = Category.create(name: "Brew Gear")

# # Rails.logger.debug "Creating #{gear.name}"

# # downloaded_image = URI.open("https://source.unsplash.com/600x600/?kettle")
# # gear.image.attach(io: downloaded_image, filename: "m-#{gear.name}.jpg")

# tea = Category.create(name: "Loose Leaf Tea")

# # Rails.logger.debug "Creating #{tea.name}"

# # downloaded_image = URI.open("https://source.unsplash.com/600x600/?tea")
# # tea.image.attach(io: downloaded_image, filename: "m-#{tea.name}.jpg")

# categories.each do |category|
#   c = Category.create(name: category.to_s)

#   # downloaded_image = URI.open("https://source.unsplash.com/600x600/?coffee")
#   # c.image.attach(io: downloaded_image, filename: "m-#{c.name}.jpg")
#   # sleep(0.5)

#   5.times do
#     p = Product.create(
#       name:           Faker::Coffee.unique.blend_name,
#       price:          Faker::Commerce.price(range: 15..20.0),
#       in_stock:       true,
#       stock_quantity: Faker::Number.between(from: 1, to: 20),
#       description:    "From #{Faker::Coffee.origin}, " \
#                       "this coffee has notes of #{Faker::Coffee.unique.notes}."
#     )

#     yolo = ProductCategory.create(
#       product:  p,
#       category: c
#     )

#     # downloaded_image = URI.open("https://source.unsplash.com/600x600/?coffee")
#     # p.image.attach(io: downloaded_image, filename: "m-#{p.name}.jpg")
#     # sleep(0.5)
#   end
# end
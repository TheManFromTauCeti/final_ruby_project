class Product < ApplicationRecord
  has_many :product_categories, dependent: :destroy
  has_many :categories, through: :product_categories
  accepts_nested_attributes_for :product_categories, allow_destroy: true
  validates :name, :description, :price, :stock_quantity, presence: true
  validates :stock_quantity, numericality: { message: "must be a number", only_integer: true }
  validates :price, numericality: { message: "must be a number" }
  has_one_attached :image

#   validate :image_format

#   def resize_image
#     return unless image.attached?

#     resized_image = MiniMagick::Image.read(image.download)   # Don't see why this doesn't work?
#     resized_image = resized_image.resize "400 X 400"
#     v_filename = image.filename
#     v_content_type = image.content_type
#     image.purge
#     image.attach(
#       io:           File.open(resized_image.path),
#       filename:     v_filename,
#       content_type: v_content_type
#     )
#   end

#   private
#   def image_format
#     return unless image.attached?
#     if image.blob.content_type.start_with? 'image/'
#     if image.blob.byte_size > 10.megabytes
#       errors.add(:image, 'size needs to be less than 10MB')
#       image.purge
#     else
#       resize_image
#     end
#     else
#       image.purge
#       errors.add(:image, 'needs to be an image')
#     end
#   end
end

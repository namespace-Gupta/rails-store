# frozen_string_literal: true

class Product < ApplicationRecord
  validates :title, :price, presence: true
  has_many :product_categories
  has_many :categories, through: :product_categories
  has_many :variants, class_name: 'ProductVariant'
  paginates_per 10
  #has_one_attached :image

  # def thumbnail
  #   image.variant(resize: '200x200').processed
  # end

  mount_uploader :image, AvatarUploader
end

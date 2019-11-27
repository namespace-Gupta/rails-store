# frozen_string_literal: true

class CategoriesController < ApplicationController
  def index
    @categories = Category.joins(:products).select('categories.*, count(products.id) as products_count').group('categories.id').order(:title)
  end
end

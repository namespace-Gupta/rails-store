# frozen_string_literal: true

class Order < ApplicationRecord
  has_many :items, class_name: 'OrderItem'
end

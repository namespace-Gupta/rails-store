class Page < ApplicationRecord
  validates :title, :permalink, presence: true
  validates :permalink, uniqueness: true
end

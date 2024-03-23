class Recipe < ApplicationRecord
  validates :title, presence: true
  validates :instructions, presence: true
  has_and_belongs_to_many :ingredients
end

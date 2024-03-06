class User < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :characters, through: :favorites
end

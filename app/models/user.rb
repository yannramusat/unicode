class User < ApplicationRecord
  has_many :favorites
  has_many :characters, through: :favorites, dependent: :destroy
end

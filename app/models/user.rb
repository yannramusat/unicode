class User < ApplicationRecord
  has_many :favorites
  has_many :characters, through: :favorites
end

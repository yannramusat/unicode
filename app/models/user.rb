class User < ApplicationRecord
  has_many :favorites, dependent: :destroy
  has_many :characters, -> { distinct }, through: :favorites

  validates :username, presence: true
  validates :mail, presence: true, uniqueness: true
end

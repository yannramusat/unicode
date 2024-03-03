class Character < ApplicationRecord
  self.primary_key = :codepoint
  
  has_many :favorites
  has_many :users, through: :favorites
  
  has_many :lowercases, class_name: "Character", foreign_key: :uppercase, inverse_of: :to_uppercase, dependent: :nullify
  has_many :uppercases, class_name: "Character", foreign_key: :lowercase, inverse_of: :to_lowercase, dependent: :nullify

  belongs_to :to_uppercase, class_name: "Character", optional: true, foreign_key: :uppercase
  belongs_to :to_lowercase, class_name: "Character", optional: true, foreign_key: :lowercase
  belongs_to :to_titlecase, class_name: "Character", optional: true, foreign_key: :titlecase
end

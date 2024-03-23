class Ingredient < ApplicationRecord
    validates :name, presence: true
    has_and_belongs_to_many :recipes

    # from: https://stackoverflow.com/questions/23207644/search-using-like-query-in-ruby-on-rails
    def self.search(pattern)
      if pattern.blank?  # blank? covers both nil and empty string
        all
      else
        where('name LIKE ?', "%#{pattern}%")
      end
    end
end

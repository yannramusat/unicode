class CreateFavorites < ActiveRecord::Migration[7.1]
  def change
    create_table :favorites do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :character_id, null: false, limit: 6, index: true

      t.timestamps
    end
    add_foreign_key :favorites, :characters, primary_key: :codepoint
  end
end

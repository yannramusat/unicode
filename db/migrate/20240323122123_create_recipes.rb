class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :instructions
      t.string :category

      t.timestamps
    end
  end
end

class CreateCharacters < ActiveRecord::Migration[7.1]
  def change
    create_table :characters, primary_key: :codepoint, id: {type: :string, limit: 6} do |t|
      t.text :charname, index: true
      t.string :category, null: false, limit: 2
      t.integer :combining, null: false
      t.string :bidi, null: false, limit: 3
      t.text :decomposition
      t.integer :decimal
      t.integer :digit
      t.text :numeric, index: true
      t.string :mirrored, null: false, limit: 1
      t.text :oldname
      t.text :comment
      t.string :uppercase, limit: 6
      t.string :lowercase, limit: 6
      t.string :titlecase, limit: 6

      t.timestamps
    end
  end
end

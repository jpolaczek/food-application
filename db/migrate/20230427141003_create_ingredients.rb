class CreateIngredients < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredients do |t|
      t.references :section, null: false, foreign_key: true
      t.string :raw_text

      t.timestamps
    end
  end
end

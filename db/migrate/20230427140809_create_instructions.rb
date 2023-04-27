class CreateInstructions < ActiveRecord::Migration[7.0]
  def change
    create_table :instructions do |t|
      t.text :display_text
      t.integer :position
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end

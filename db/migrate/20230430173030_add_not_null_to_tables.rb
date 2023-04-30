class AddNotNullToTables < ActiveRecord::Migration[7.0]
  def change
    change_column :recipes, :name, :string, null: false
    change_column :components, :raw_text, :string, null: false
    change_column :instructions, :display_text, :string, null: false
  end
end

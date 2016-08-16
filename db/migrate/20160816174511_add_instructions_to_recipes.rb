class AddInstructionsToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :instructions, :string
  end
end

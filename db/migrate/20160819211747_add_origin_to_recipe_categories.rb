class AddOriginToRecipeCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :recipe_categories, :origin, :string
  end
end

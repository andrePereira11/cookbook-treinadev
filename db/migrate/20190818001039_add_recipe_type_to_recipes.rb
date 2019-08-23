class AddRecipeTypeToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :recipe_type, :string
  end
end

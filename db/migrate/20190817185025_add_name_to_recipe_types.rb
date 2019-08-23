class AddNameToRecipeTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipe_types, :name, :string
  end
end

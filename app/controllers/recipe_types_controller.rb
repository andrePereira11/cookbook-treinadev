class RecipeTypesController < ApplicationController
  def show
    @recipe_type = RecipeType.find(params[:id])
  end

  def new
    @recipe_type = RecipeType.new
  end

  def create
    @recipe_type = RecipeType.new(params.require(:recipe_type).permit(:name))

    if !recipe_type_exist?(params[:name]) && @recipe_type.save
      redirect_to @recipe_type
    else
      if params[:name] != ''
        flash[:alert] = 'Você deve informar o nome do tipo de receita'
      elsif recipe_type_exist?(params[:name])
        flash[:alert] = 'Esse tipo de receita ja existe'
      end
      render :new
    end
  end

  private

  def recipe_type_exist?(text)
    if RecipeType.where(name: text) != []
      true
    else
      false
    end
  end
end
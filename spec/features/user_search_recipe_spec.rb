require 'rails_helper'

feature 'user search recipe' do
  scenario 'search completed name' do
    #dados
    recipe_type = RecipeType.create(name: 'Entrada')
    cuisine = Cuisine.create(name: 'Arabe')
    Recipe.create(title:'Bolo de Cenoura', recipe_type: recipe_type, cuisine: cuisine, difficulty:'Médio', cook_time:30, ingredients:'Oleo', cook_method:'Mistura tudo')
    Recipe.create(title:'Bolo de Aipim', recipe_type: recipe_type, cuisine: cuisine, difficulty:'Médio', cook_time:30, ingredients:'Oleo', cook_method:'Mistura tudo')

    #navegação
    visit root_path
    fill_in 'Search', with: 'Bolo de Cenoura'
    click_on 'Search'

    #resultados
    expect(page).not_to have_content('Bolo de Aipim')
    expect(page).to have_content('Bolo de Cenoura')
    expect(page).to have_content('Entrada')
  end

  scenario 'not found' do
    #dados
    recipe_type = RecipeType.create(name: 'Entrada')
    cuisine = Cuisine.create(name: 'Arabe')
    Recipe.create(title:'Bolo de Cenoura', recipe_type: recipe_type, cuisine: cuisine, difficulty:'Médio', cook_time:30, ingredients:'Oleo', cook_method:'Mistura tudo')

    #navegação
    visit root_path
    fill_in 'Search', with: 'Bolo de Aipim'
    click_on 'Search'

    #resultados
    expect(page).not_to have_content('Bolo de Cenoura')
    expect(page).to have_content('Não foi encontrado nenhum resultado')
  end

  scenario 'part name' do
    #dados
    recipe_type = RecipeType.create(name: 'Entrada')
    cuisine = Cuisine.create(name: 'Arabe')
    Recipe.create(title:'Bolo de Cenoura', recipe_type: recipe_type, cuisine: cuisine, difficulty:'Médio', cook_time:30, ingredients:'Oleo', cook_method:'Mistura tudo')
    Recipe.create(title:'Bolo de Aipim', recipe_type: recipe_type, cuisine: cuisine, difficulty:'Médio', cook_time:30, ingredients:'Oleo', cook_method:'Mistura tudo')
    Recipe.create(title:'Torta', recipe_type: recipe_type, cuisine: cuisine, difficulty:'Médio', cook_time:30, ingredients:'Oleo', cook_method:'Mistura tudo')

    #navegação
    visit root_path
    fill_in 'Search', with: 'Bolo'
    click_on 'Search'

    #resultados
    expect(page).to have_content('Bolo de Cenoura')
    expect(page).to have_content('Bolo de Aipim')
    expect(page).not_to have_content('Torta')
  end
end